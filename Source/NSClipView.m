/*
   NSClipView.m

   Copyright (C) 1996 Free Software Foundation, Inc.

   Author: Ovidiu Predescu <ovidiu@net-community.com>
   Date: July 1997

   This file is part of the GNUstep GUI Library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with this library; if not, write to the Free
   Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

#include <gnustep/gui/config.h>
#include <Foundation/NSNotification.h>

#include <AppKit/NSClipView.h>
#include <AppKit/NSCursor.h>
#include <AppKit/NSColor.h>
#include <AppKit/NSWindow.h>
#include <AppKit/NSGraphics.h>

@implementation NSClipView

- init
{
  [super init];
  [self setAutoresizesSubviews:YES];
  [self setBackgroundColor:[NSColor lightGrayColor]];
  _copiesOnScroll = NO;
  return self;
}

- (void) setDocumentView: (NSView*)aView
{
  if (_documentView == aView)
    return;
  if (_documentView)
    [_documentView removeFromSuperview];

  ASSIGN(_documentView, aView);

  if (_documentView)
    {
      NSRect	df;

      [self addSubview: _documentView];

      df = [_documentView frame];
      if ([_documentView isFlipped])
	df.origin.y += bounds.size.height - df.size.height;
      [self setBoundsOrigin: df.origin];
      if ([aView respondsToSelector: @selector(backgroundColor)])
	[self setBackgroundColor: [(id)aView backgroundColor]];


      /* Register for notifications sent by the document view */
      [_documentView setPostsFrameChangedNotifications:YES];
      [_documentView setPostsBoundsChangedNotifications:YES];

      [[NSNotificationCenter defaultCenter] addObserver:self
	selector:@selector(viewFrameChanged:)
	name:NSViewFrameDidChangeNotification object:_documentView];
      [[NSNotificationCenter defaultCenter] addObserver:self
	selector:@selector(viewBoundsChanged:)
	name:NSViewBoundsDidChangeNotification object:_documentView];
    }

  /* TODO: invoke superview's reflectScrolledClipView:? */
  [[self superview] reflectScrolledClipView:self];
}

- (void) resetCursorRects
{
  [self addCursorRect:[self bounds] cursor:_cursor];
}

- (void) resizeSubviewsWithOldSize: (NSSize)old_size
{
  [super resizeSubviewsWithOldSize: old_size];
  if ([_documentView isFlipped])
    {
      [self scrollToPoint: bounds.origin];
    }
}

- (void) scrollToPoint: (NSPoint)point
{
  NSRect originalBounds = [self bounds];
  NSRect newBounds = originalBounds;
  NSRect intersection;
#ifdef DEBUGLOG
  NSPoint currentPoint = [self bounds].origin;

  NSLog (@"scrollToPoint: current point (%f, %f), point (%f, %f)",
	currentPoint.x, currentPoint.y,
	point.x, point.y);
#endif

  newBounds.origin = [self constrainScrollPoint: point];

  if (NSEqualPoints(originalBounds.origin, newBounds.origin))
    return;

  if (_copiesOnScroll)
    {
      // copy the portion of the view that is common before and after scrolling.
      // then tell docview to draw the exposed parts.
      // intersection is the common rectangle
      intersection = NSIntersectionRect(originalBounds, newBounds);
      if (NSEqualRects(intersection, NSZeroRect))
	{
	  // no intersection -- docview should draw everything
	  [self setBoundsOrigin: newBounds.origin];
	  [_documentView setNeedsDisplayInRect:
                  [self convertRect: newBounds toView: _documentView]];
	}
      else
	{
	  NSPoint destPoint = intersection.origin;
	  float dx = newBounds.origin.x - originalBounds.origin.x;
	  float dy = newBounds.origin.y - originalBounds.origin.y;
	  destPoint.x -= dx;
	  destPoint.y -= dy;
	  [self lockFocus];
	  NSCopyBits(0, intersection, destPoint);
	  [self unlockFocus];

	  [self setBoundsOrigin: newBounds.origin];
	  if (dx != 0)
	    {
	      // moved in x -- redraw a full-height rectangle at
	      // side of intersection
	      NSRect redrawRect;

	      redrawRect.origin.y = newBounds.origin.y;
	      redrawRect.size.height = newBounds.size.height;
	      redrawRect.size.width = newBounds.size.width
					- intersection.size.width;
	      if (dx < 0)
		{
		  // moved to the left -- redraw at left of intersection
		  redrawRect.origin.x = newBounds.origin.x;
		}
	      else
		{
		  // moved to the right -- redraw at right of intersection
		  redrawRect.origin.x = newBounds.origin.x
					+ intersection.size.width;
		}
	      [_documentView setNeedsDisplayInRect:
                      [self convertRect: redrawRect toView: _documentView]];
	    }

	  if (dy != 0)
	    {
	      // moved in y
	      // -- redraw rectangle with intersection's width over or under it
	      NSRect redrawRect;

	      redrawRect.origin.x = intersection.origin.x;
	      redrawRect.size.width = intersection.size.width;
	      redrawRect.size.height = newBounds.size.height
					- intersection.size.height;
	      if (dy < 0)
		{
		  // moved down -- redraw under intersection
		  redrawRect.origin.y = newBounds.origin.y;
		}
	      else
		{
		  // moved up -- redraw over intersection
		  redrawRect.origin.y = newBounds.origin.y
					+ intersection.size.height;
		}
	      [_documentView setNeedsDisplayInRect:
                      [self convertRect: redrawRect toView: _documentView]];
	    }
	}
    }
  else
    {
      // dont copy anything -- docview draws it all
      [self setBoundsOrigin: newBounds.origin];
      [_documentView setNeedsDisplayInRect:
              [self convertRect: newBounds toView: _documentView]];
    }
}

- (NSPoint) constrainScrollPoint: (NSPoint)proposedNewOrigin
{
  NSRect	documentFrame = [_documentView frame];
  NSPoint	new = proposedNewOrigin;

  if (documentFrame.size.width <= bounds.size.width)
    new.x = documentFrame.origin.x;
  else if (proposedNewOrigin.x <= documentFrame.origin.x)
    new.x = documentFrame.origin.x;
  else if (proposedNewOrigin.x
	   >= documentFrame.size.width - bounds.size.width)
    new.x = documentFrame.size.width - bounds.size.width;

  if ([_documentView isFlipped])
    {
      if (documentFrame.size.height <= bounds.size.height)
	new.y = documentFrame.origin.y
		+ (documentFrame.size.height - bounds.size.height);
      else if (proposedNewOrigin.y <= 0)
	new.y = 0;
      else if (proposedNewOrigin.y
	>= documentFrame.size.height - bounds.size.height)
	new.y = documentFrame.size.height - bounds.size.height;
    }
  else
    {
      if (documentFrame.size.height <= bounds.size.height)
	new.y = documentFrame.origin.y;
      else if (proposedNewOrigin.y <= documentFrame.origin.y)
	new.y = documentFrame.origin.y;
      else if (proposedNewOrigin.y
	   >= documentFrame.size.height - bounds.size.height)
	new.y = documentFrame.size.height - bounds.size.height;
    }

  return new;
}

- (NSRect) documentRect
{
  NSRect documentFrame = [_documentView frame];
  NSRect clipViewBounds = bounds;
  NSRect rect;

  rect.origin = documentFrame.origin;
  rect.size.width = MAX(documentFrame.size.width, clipViewBounds.size.width);
  rect.size.height = MAX(documentFrame.size.height,clipViewBounds.size.height);

  return rect;
}

- (NSRect) documentVisibleRect
{
  NSRect documentBounds = [_documentView bounds];
  NSRect clipViewBounds = bounds;
  NSRect rect;

  rect.origin = clipViewBounds.origin;
  rect.size.width = MIN(documentBounds.size.width, clipViewBounds.size.width);
  rect.size.height = MIN(documentBounds.size.height,
			 clipViewBounds.size.height);

  return rect;
}

- (void) drawRect: (NSRect)rect
{
  [[self backgroundColor] set];
  NSRectFill(rect);
}

- (BOOL) autoscroll: (NSEvent*)theEvent
{
  return 0;
}

- (void) viewBoundsChanged: (NSNotification*)aNotification
{
  [super_view reflectScrolledClipView:self];
}

- (void) viewFrameChanged: (NSNotification*)aNotification
{
  [self setBoundsOrigin: [self constrainScrollPoint: bounds.origin]];
  [super_view reflectScrolledClipView:self];
}

- (void) scaleUnitSquareToSize: (NSSize)newUnitSize
{
  [super scaleUnitSquareToSize:newUnitSize];
  [super_view reflectScrolledClipView:self];
}

- (void) setBoundsOrigin: (NSPoint)aPoint
{
  [super setBoundsOrigin:aPoint];
  [super_view reflectScrolledClipView:self];
}

- (void) setBoundsSize: (NSSize)aSize
{
  [super setBoundsSize:aSize];
  [super_view reflectScrolledClipView:self];
}

- (void) setFrameSize: (NSSize)aSize
{
  [super setFrameSize:aSize];
  [super_view reflectScrolledClipView:self];
}

- (void) setFrameOrigin: (NSPoint)aPoint
{
  [super setFrameOrigin:aPoint];
  [super_view reflectScrolledClipView:self];
}

- (void) setFrame: (NSRect)rect
{
  [super setFrame:rect];
  [super_view reflectScrolledClipView:self];
}

- (void) translateOriginToPoint: (NSPoint)aPoint
{
  [super translateOriginToPoint:aPoint];
  [super_view reflectScrolledClipView:self];
}

- (BOOL) isOpaque
{
  return YES;
}

- (id) documentView
{
  return _documentView;
}

- (void) setCopiesOnScroll: (BOOL)flag
{
  _copiesOnScroll = flag;
}

- (BOOL) copiesOnScroll
{
  return _copiesOnScroll;
}

- (void) setDocumentCursor: (NSCursor*)aCursor
{
  ASSIGN(_cursor, aCursor);
}

- (NSCursor*) documentCursor
{
  return _cursor;
}

- (NSColor*) backgroundColor
{
  return _backgroundColor;
}

- (BOOL) isFlipped
{
  return [_documentView isFlipped];
}

- (BOOL) acceptsFirstResponder
{
  return _documentView != nil;
}

- (void) setBackgroundColor: (NSColor*)aColor
{
  ASSIGN(_backgroundColor, aColor);
}

/* Disable rotation of clip view */
- (void) rotateByAngle: (float)angle
{}

- (void) setBoundsRotation: (float)angle
{}

- (void) setFrameRotation: (float)angle
{}

/* Managing responder chain */
- (BOOL) becomeFirstResponder
{
  return [_documentView becomeFirstResponder];
}

@end
