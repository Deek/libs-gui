/*
   NSLayoutManager.m

   The text layout manager class

   Copyright (C) 1999 Free Software Foundation, Inc.

   Author:  Jonathan Gapen <jagapen@smithlab.chem.wisc.edu>
   Date: July 1999
   Author:  Michael Hanni <mhanni@sprintmail.com>
   Date: August 1999

   This file is part of the GNUstep GUI Library.

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public
   License as published by the Free Software Foundation; either
   version 2 of the License, or (at your option) any later version.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with this library; see the file COPYING.LIB.
   If not, write to the Free Software Foundation,
   59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
*/
#include <AppKit/NSLayoutManager.h>
#include "GSSimpleLayoutManager.h"

/*
 * A little utility function to determine the range of characters in a scanner
 * that are present in a specified character set.
 */
static inline NSRange
scanRange(NSScanner *scanner, NSCharacterSet* aSet)
{
  unsigned	start = [scanner scanLocation];
  unsigned	end = start;

  if ([scanner scanCharactersFromSet: aSet intoString: 0] == YES)
    {
      end = [scanner scanLocation];
    }
  return NSMakeRange(start, end - start);
}


// _GSRunSearchKey is an internal class which serves as the foundation for
// all our searching. This may not be an elegant way to go about this, so
// if someone wants to optimize this out, please do.

@interface _GSRunSearchKey : NSObject
{
@public
  NSRange glyphRange;
}
@end

@implementation _GSRunSearchKey
- (id) init
{
  return [super init];
}

- (void) dealloc
{
  [super dealloc];
}
@end

@interface GSGlyphLocation : _GSRunSearchKey
{
@public
  NSPoint point;
}
@end

@implementation GSGlyphLocation
- (id) init
{
  return [super init];
}

- (void) dealloc
{
  [super dealloc];
}
@end

@interface GSLineLayoutInfo : _GSRunSearchKey
{
@public
  NSRect lineFragmentRect;
  NSRect usedRect;
}
@end

@implementation GSLineLayoutInfo
- (id) init
{
  return [super init];
}

- (void) dealloc
{
  [super dealloc];
}
@end

@interface GSTextContainerLayoutInfo : _GSRunSearchKey
{
@public
  NSTextContainer	*textContainer;
  NSString		*testString;
}
@end

@implementation GSTextContainerLayoutInfo
- (id) init
{
  return [super init];
}

- (void) dealloc
{
  [super dealloc];
}
@end

#define GSI_ARRAY_TYPES       GSUNION_OBJ

#ifdef GSIArray
#undef GSIArray
#endif
#include <base/GSIArray.h>

static NSComparisonResult aSort(GSIArrayItem i0, GSIArrayItem i1)
{
  if (((_GSRunSearchKey*)(i0.obj))->glyphRange.location
    < ((_GSRunSearchKey*)(i1.obj))->glyphRange.location)
    return NSOrderedAscending;
  else if (((_GSRunSearchKey*)(i0.obj))->glyphRange.location
    >= NSMaxRange(((_GSRunSearchKey*)(i1.obj))->glyphRange))
    return NSOrderedDescending;
  else
    return NSOrderedSame;
}

@interface GSRunStorage : NSObject
{
  unsigned int _count;
  void *_runs;
}
- (void) insertObject: (id)anObject;
- (void) insertObject: (id)anObject atIndex: (unsigned)theIndex;
- (id) objectAtIndex: (unsigned)theIndex;
- (unsigned) indexOfObject: (id)anObject;
- (unsigned) indexOfObjectContainingLocation: (unsigned)aLocation;
- (id) objectContainingLocation: (unsigned)aLocation;
- (int) count;
@end

@implementation GSRunStorage
- (id) init
{
  NSZone *z;

  [super init];

  z = [self zone];

  _runs = NSZoneMalloc(z, sizeof(GSIArray_t));
  GSIArrayInitWithZoneAndCapacity((GSIArray)_runs, z, 8);

  return self;
}

- (void) insertObject: (id)anObject
{
  _GSRunSearchKey *aKey = [_GSRunSearchKey new];
  _GSRunSearchKey *aObject = (_GSRunSearchKey*)anObject;
  int position;

  aKey->glyphRange.location = aObject->glyphRange.location;

  position = GSIArrayInsertionPosition(_runs, (GSIArrayItem)aKey, aSort);

//  NSLog(@"key: %d aObject: %d position: %d", aKey->glyphRange.location,
//aObject->glyphRange.location, position);

  if (position > 0)
    {
      _GSRunSearchKey *anKey = GSIArrayItemAtIndex(_runs, (unsigned)position - 1).obj;

      if (anKey->glyphRange.location == aObject->glyphRange.location)
        {
//          GSIArrayInsertSorted(_runs, (GSIArrayItem)anObject, aSort);
//	  NSLog(@"=========> duplicated item.");
	  GSIArraySetItemAtIndex(_runs, (GSIArrayItem)anObject, position-1);
        }
      else
	{
//	  NSLog(@"=========> not duplicated item.");
	  GSIArrayInsertItem(_runs, (GSIArrayItem)anObject, position);
	}
    }
  else if (position == 0)
    {
//	NSLog(@"=========> first item (zero index).");
	GSIArrayInsertItem(_runs, (GSIArrayItem)anObject, position);
//      GSIArrayInsertSorted(_runs, (GSIArrayItem)anObject, aSort);
//      [self insertObject: anObject atIndex: position];
    }
  else
    NSLog(@"dead. VERY DEAD DEAD DEAD DEAD.");

//  NSLog(@"==> %d item(s)", GSIArrayCount(_runs));
}

- (void) insertObject: (id)anObject
	      atIndex: (unsigned)theIndex
{
  NSLog(@"insertObject: atIndex: called. %d item(s)", GSIArrayCount(_runs));
  GSIArrayInsertSorted(_runs, (GSIArrayItem)anObject, aSort);
//  GSIArrayInsertItem(_runs, (GSIArrayItem)anObject, theIndex);
  NSLog(@"insertObject: atIndex: ended. %d item(s)", GSIArrayCount(_runs));
}

- (void) removeObjectAtIndex: (int)theIndex
{
  GSIArrayRemoveItemAtIndex(_runs, theIndex);
}

- (id) objectAtIndex: (unsigned)theIndex
{
  return GSIArrayItemAtIndex(_runs, (unsigned)theIndex).obj;
}

- (unsigned) indexOfObject: (id)anObject
{
  return NSNotFound;
}

- (unsigned) indexOfObjectContainingLocation: (unsigned)aLocation
{
  _GSRunSearchKey *aKey = [_GSRunSearchKey new];
  int position;

  aKey->glyphRange.location = aLocation;

  position = GSIArrayInsertionPosition(_runs, (GSIArrayItem)aKey, aSort);

  if (position >= 0 && position - 1 >= 0)
    {
      aKey = GSIArrayItemAtIndex(_runs, (unsigned)position - 1).obj;

      if (NSLocationInRange(aLocation, aKey->glyphRange))
        {
	  return (position - 1);
        }
    }

  return -1;
}

- (id) objectContainingLocation: (unsigned)aLocation
{
  _GSRunSearchKey *aKey = [_GSRunSearchKey new];
  int position;

  aKey->glyphRange.location = aLocation;

  position = GSIArrayInsertionPosition(_runs, (GSIArrayItem)aKey, aSort);

  if (position >= 0 && position - 1 >= 0)
    {
      aKey = GSIArrayItemAtIndex(_runs, (unsigned)position - 1).obj;

      if (NSLocationInRange(aLocation, aKey->glyphRange))
        {
	  return aKey;
        }
    }

  return nil;  
}

- (id) lastObject
{
  return GSIArrayItemAtIndex(_runs, GSIArrayCount(_runs) - 1).obj;
}

- (int) count
{
  return GSIArrayCount(_runs);
}
@end



@interface NSLayoutManager (Private)

- (void) _doLayout;
- (int) _rebuildLayoutForTextContainer: (NSTextContainer*)aContainer
		  startingAtGlyphIndex: (int)glyphIndex;

@end



@implementation NSLayoutManager

+ (id) allocWithZone: (NSZone*)z
{
  // Return a simple layout manager as this is the only working subclass
  if (self == [NSLayoutManager class])
    {
      return [GSSimpleLayoutManager allocWithZone: z];
    }
  else
    {
      return NSAllocateObject (self, 0, z);
    }
}

// Designated Initializer.  Sets up this instance.  Finds the shared NSGlyphGenerator 
// and the shared default NSTypesetter.  The NSLayoutManager starts off without a 
// NSTextStorage
- (id) init
{
  [super init];

  _backgroundLayout = YES;
  _delegate = nil;
  _textContainers = [[NSMutableArray alloc] initWithCapacity: 2];

  _containerRuns = [GSRunStorage new];
  _fragmentRuns = [GSRunStorage new];
  _locationRuns = [GSRunStorage new];

  return self;
}

- (void) dealloc
{
  RELEASE(_textContainers);

  RELEASE(_containerRuns);
  RELEASE(_fragmentRuns);
  RELEASE(_locationRuns);

  [super dealloc];
}

//
// Setting the text storage
//
// The set method generally should not be called directly, but you may want to override 
// it.  Used to get and set the text storage.  The set method is called by the 
// NSTextStorage's addTextStorageObserver/removeTextStorageObserver methods.
- (void) setTextStorage: (NSTextStorage*)aTextStorage
{
  unsigned length = [aTextStorage length];
  NSRange aRange = NSMakeRange(0, length);

  ASSIGN(_textStorage, aTextStorage);
  // force complete re - layout
  [self textStorage: aTextStorage
	edited: NSTextStorageEditedCharacters | NSTextStorageEditedAttributes
	range: aRange
	changeInLength: length 
	invalidatedRange: aRange];
}

- (NSTextStorage*) textStorage
{
  return _textStorage;
}

// This method should be used instead of the primitive -setTextStorage: if you need to 
// replace a NSLayoutManager's NSTextStorage with a new one leaving the rest of the 
// web intact.  This method deals with all the work of making sure the NSLayoutManager 
// doesn't get deallocated and transferring all the NSLayoutManager s on the old 
// NSTextStorage to the new one.
- (void) replaceTextStorage: (NSTextStorage*)newTextStorage
{
  NSArray *layoutManagers = [_textStorage layoutManagers];
  NSEnumerator *enumerator = [layoutManagers objectEnumerator];
  NSLayoutManager *object;

  // Remove layout managers from old NSTextStorage object and add them to the
  // new one.  NSTextStorage's addLayoutManager invokes NSLayoutManager's
  // setTextStorage method automatically, and that includes self.

  while( (object = (NSLayoutManager*)[enumerator nextObject]) )
  {
    [_textStorage removeLayoutManager: object];
    [newTextStorage addLayoutManager: object];
  }
}

//
// Setting text containers
//
- (NSArray*) textContainers
{
  return _textContainers;
}

// Add a container to the end of the array.  Must invalidate layout of all glyphs 
// after the previous last container (ie glyphs that were not previously laid out 
// because they would not fit anywhere).
- (void) addTextContainer: (NSTextContainer*)obj
{
  if ( [_textContainers indexOfObjectIdenticalTo: obj] == NSNotFound )
  {
    [_textContainers addObject: obj];
    [obj setLayoutManager: self];
  }
}

// Insert a container into the array before the container at index.  Must invalidate 
// layout of all glyphs in the containers from the one previously at index to the 
// last container.
- (void) insertTextContainer: (NSTextContainer*)aTextContainer
		     atIndex: (unsigned)index
{
  [_textContainers insertObject: aTextContainer atIndex: index];
}

// Removes the container at index from the array.  Must invalidate layout of all 
// glyphs in the container being removed and any containers which come after it.
- (void) removeTextContainerAtIndex: (unsigned)index
{
  [_textContainers removeObjectAtIndex: index];
}

//
// Invalidating glyphs and layout
//

// This removes all glyphs for the old character range, adjusts the character 
// indices of all the subsequent glyphs by the change in length, and invalidates 
// the new character range.  If actualCharRange is non-NULL it will be set to 
// the actual range invalidated after any necessary expansion.
- (void) invalidateGlyphsForCharacterRange: (NSRange)aRange
			    changeInLength: (int)lengthChange
		      actualCharacterRange: (NSRange*)actualRange
{
  // FIXME

  // Currently we don't have context information
  if (actualRange)
    {
      *actualRange = aRange;
    }
}

// This invalidates the layout information (glyph location and rotation) for 
// the given range of characters.  If flag is YES then this range is marked 
// as a hard layout invalidation.  If NO, then the invalidation is soft.  
// A hard invalid layout range indicates that layout information must be completely 
// recalculated no matter what.  A soft invalid layout range means that there 
// is already old layout info for the range in question, and if the NSLayoutManager 
// is smart enough to figure out how to avoid doing the complete relayout, it may 
// perform any optimization available.  If actualCharRange is non-NULL it will be 
// set to the actual range invalidated after any necessary expansion.
- (void) invalidateLayoutForCharacterRange: (NSRange)aRange
				    isSoft: (BOOL)flag
		      actualCharacterRange: (NSRange*)actualRange
{

  [self _doLayout];
}

// Invalidates display for the glyph or character range given.  For the glyph 
// range variant any part of the range that does not yet have glyphs generated 
// is ignored.  For the character range variant, unlaid parts of the range are 
// remembered and will definitely be redisplayed at some point later when the 
// layout is available.  Neither method actually causes layout.
- (void) invalidateDisplayForCharacterRange: (NSRange)aRange
{
}

- (void) invalidateDisplayForGlyphRange: (NSRange)aRange
{
}

// Invalidates layout of all glyphs in container and all subsequent containers.
- (void) textContainerChangedGeometry: (NSTextContainer*)aContainer
{
  unsigned first = 0;

  // find the first character in that text container

  // invalidate the layout from here on
  [self invalidateLayoutForCharacterRange: 
	    NSMakeRange(first, [_textStorage length] - first)
	isSoft: NO
	actualCharacterRange: NULL];
}

// Called by NSTextContainer whenever its textView changes.  
// Used to keep notifications in synch.
- (void) textContainerChangedTextView: (NSTextContainer*)aContainer
{
}

// Sent from processEditing in NSTextStorage. newCharRange is the range in the 
// final string which was explicitly edited. invalidatedRange includes stuff 
// which was changed as a result of attribute fixing. invalidatedRange is either 
// equal to newCharRange or larger. Layout managers should not change the contents
// of the text storage during the execution of this message.
- (void) textStorage: (NSTextStorage*)aTextStorage
	      edited: (unsigned)mask
	       range: (NSRange)range
      changeInLength: (int)lengthChange
    invalidatedRange: (NSRange)invalidatedRange
{
/*
  NSLog(@"NSLayoutManager was just notified that a change in the text
storage occured.");
  NSLog(@"range: (%d, %d) changeInLength: %d invalidatedRange (%d, %d)",
range.location, range.length, lengthChange, invalidatedRange.location,
invalidatedRange.length);
*/
  int delta = 0;
  unsigned last = NSMaxRange(invalidatedRange);

  if (mask & NSTextStorageEditedCharacters)
    {
      delta = lengthChange;
    }

  // hard invalidation occures here.
  [self invalidateGlyphsForCharacterRange: range 
	changeInLength: delta
	actualCharacterRange: NULL];
  [self invalidateLayoutForCharacterRange: invalidatedRange 
	isSoft: NO
	actualCharacterRange: NULL];

  // the following range is soft invalidated
  [self invalidateLayoutForCharacterRange: 
	    NSMakeRange(last, [_textStorage length] - last)
	isSoft: YES
	actualCharacterRange: NULL];
}

//
// Turning on/off background layout
//

// These methods allow you to set/query whether text gets laid out in the 
// background when there's nothing else to do.
- (void) setBackgroundLayoutEnabled: (BOOL)flag
{
  _backgroundLayout = flag;
}

- (BOOL) backgroundLayoutEnabled
{
  return _backgroundLayout;
}

//
// Accessing glyphs
//
// These methods are primitive.  They do not cause the bookkeeping of filling 
// holes to happen.  They do not cause invalidation of other stuff.

// Inserts a single glyph into the glyph stream at glyphIndex.  The character 
// index which this glyph corresponds to is given by charIndex.
- (void) insertGlyph: (NSGlyph)aGlyph
	atGlyphIndex: (unsigned)glyphIndex
      characterIndex: (unsigned)charIndex
{
}

// If there are any holes in the glyph stream this will cause glyph generation 
// for all holes sequentially encountered until the desired index is available. 
// The first variant raises a NSRangeError if the requested index is out of 
// bounds, the second does not, but instead optionally returns a flag indicating 
// whether the requested index exists.
- (NSGlyph) glyphAtIndex: (unsigned)index
{
  return NSNullGlyph;
}

- (NSGlyph) glyphAtIndex: (unsigned)index
	    isValidIndex: (BOOL*)flag
{
  *flag = NO;
  return NSNullGlyph;
}

// Replaces the glyph currently at glyphIndex with newGlyph.  The character index 
// of the glyph is assumed to remain the same (although it can, of coiurse, be set 
// explicitly if needed).
- (void) replaceGlyphAtIndex: (unsigned)index
		   withGlyph: (NSGlyph)newGlyph
{
}

// This causes glyph generation similarly to asking for a single glyph.  
// It formats a sequence of NSGlyphs (unsigned long ints).  It does not include 
// glyphs that aren't shown in the result but does zero-terminate the array.  
// The memory passed in to the function should be large enough for at least 
// glyphRange.length+1 elements.  The actual number of glyphs stuck into the 
// array is returned (not counting the null-termination).
// RM!!! check out the private method "_packedGlyphs:range:length:" if you need 
// to send glyphs to the window server.  It returns a (conceptually) autoreleased
// array of big-endian packeg glyphs.  Don't use this method to do that.
- (unsigned) getGlyphs: (NSGlyph*)glyphArray
		 range: (NSRange)glyphRange
{
  return (unsigned)0;
}

// Removes all glyphs in the given range from the storage.
- (void) deleteGlyphsInRange: (NSRange)aRange
{
}

// If there are any holes in the glyph stream, this will cause all invalid 
// character ranges to have glyphs generated for them.
- (unsigned) numberOfGlyphs
{
  return 0;
}

//
// Mapping characters to glyphs
//
// Sets the index of the corresponding character for the glyph at the given glyphIndex.
- (void) setCharacterIndex: (unsigned)charIndex
	   forGlyphAtIndex: (unsigned)glyphIndex
{
}

// If there are any holes in the glyph stream this will cause glyph generation 
// for all holes sequentially encountered until the desired index is available.
- (unsigned) characterIndexForGlyphAtIndex: (unsigned)glyphIndex
{
  return 0;
}

// These two methods can cause glyph generation.
// Returns the range of characters that generated the glyphs in the
// given glyphRange.  actualGlyphRange, if not NULL, will be set to
// the full range of glyphs that the character range returned generated. 
// This range may be identical or slightly larger than the requested glyphRange. 
// For instance, if the text storage contains the unichar (o-umlaut) and
// the glyph store contains the two atomic glyphs "o" and (umlaut), and
// if the glyphRange given encloses only the first or second glyph, the
// actualGlyphRange will be set to enclose both glyphs.
- (NSRange) characterRangeForGlyphRange: (NSRange)glyphRange
		       actualGlyphRange: (NSRange*)actualGlyphRange
{
  return NSMakeRange(0, 0);
}

// Returns the range of glyphs that are generated from the unichars in
// the given charRange.  actualCharRange, if not NULL, will be set to the
// actual range of characters that fully define the glyph range returned. 
// This range may be identical or slightly larger than the requested
// characterRange.  For instance, if the text storage contains the unichars
// "o" and (umlaut) and the glyph store contains the single precomposed glyph
// (o-umlaut), and if the charcterRange given encloses only the first or
// second unichar, the actualCharRange will be set to enclose both unichars.
- (NSRange) glyphRangeForCharacterRange: (NSRange)charRange
		   actualCharacterRange: (NSRange*)actualCharRange
{
  return NSMakeRange(0, 0);
}

//
// Setting glyph attributes 
//

// Each NSGlyph has an attribute field, yes?
// This method is primitive.  It does not cause any invalidation of other stuff. 
//  This method also will not cause glyph generation.  The glyph being set must 
// already be there.
// This method is used by the NSGlyphGenerator to set attributes.  It is not 
// usually necessary for anyone but the glyph generator (and perhaps the 
// typesetter) to call it.  It is provided as a public method so subclassers 
// can extend it to accept other glyph attributes.  To add new glyph attributes
// to the text system you basically need to do two things.  You need to write 
// a rulebook which will generate the attributes (in rulebooks attributes are 
// identified by integer tags).  Then you need to subclass NSLayoutManager to
// provide someplace to store the new attribute and to override this method 
// and -attribute:forGlyphAtIndex: to understand the integer tag which your
// new rulebook is generating.  NSLayoutManager's implementation understands
// the glyph attributes which it is prepared to remember.  Your override 
// should pass any glyph attributes it does not understand up to the superclass's
//  implementation.
- (void) setIntAttribute: (int)attribute
		   value: (int)anInt
	 forGlyphAtIndex: (unsigned)glyphIndex
{
}

// This returns the value for the given glyph attribute at the glyph index
// specified.  Most apps will not have much use for this info but the
// typesetter and glyph generator might need to know about certain attributes.
// You can override this method to know how to return any custom glyph 
// attributes you want to support.
- (int) intAttribute: (int)attribute
     forGlyphAtIndex: (unsigned)glyphIndex
{
  return 0;
}

//
// Handling layout for text containers 
//
// These methods are fairly primitive.  They do not cause any kind of 
// invalidation to happen.  The glyphs being set must already exist.
// This is not a hardship since the NSTypesetter will have had to ask for
// the actual glyphs already by the time it goes to set this, and asking
// for the glyphs causes the glyph to be generated if necessary.
// Associates the given container with the given range of glyphs.  This method
// should be called by the typesetter first (ie before setting line fragment
// rect or any of the layout bits) for each range of glyphs it lays out. 
// This method will set several key layout atttributes (like not shown and
// draws outside line fragment) to their default values.
- (void) setTextContainer: (NSTextContainer*)aTextContainer
	    forGlyphRange: (NSRange)glyphRange
{
  GSTextContainerLayoutInfo	*theLine = [GSTextContainerLayoutInfo new];

  theLine->glyphRange = glyphRange;
  ASSIGN(theLine->textContainer, aTextContainer);
  
  [_containerRuns insertObject: theLine];
}

// All of these methods can cause glyph generation AND layout.
// Returns the range of characters which have been laid into the
// given container.  This is a less efficient method than the similar
// -textContainerForGlyphAtIndex:effectiveRange:.
- (NSRange) glyphRangeForTextContainer: (NSTextContainer*)aTextContainer
{
  int i;

  NSLog(@"glyphRangeForTextContainer: called. There are %d
textContainer(s) in containerRuns.", [_containerRuns count]);

  for (i=0;i<[_containerRuns count];i++)
    {
      GSTextContainerLayoutInfo *aNewLine = [_containerRuns objectAtIndex: i];

/*
      NSLog(@"glyphRangeForTextContainer: (%d, %d)",
aNewLine->glyphRange.location,
aNewLine->glyphRange.length);
*/

      if ([aNewLine->textContainer isEqual: aTextContainer])
        {
/*
	  NSLog(@"glyphRangeForWantedTextContainer: (%d, %d)",
aNewLine->glyphRange.location,
aNewLine->glyphRange.length);
*/
	  return aNewLine->glyphRange;
        }
    }

  return NSMakeRange(NSNotFound, 0);
}

// Returns the container in which the given glyph is laid and (optionally)
// by reference the whole range of glyphs that are in that container. 
// This will cause glyph generation AND layout as needed.
- (NSTextContainer*) textContainerForGlyphAtIndex: (unsigned)glyphIndex
                                   effectiveRange: (NSRange*)effectiveRange
{
  GSTextContainerLayoutInfo	*theLine;

  theLine = [_containerRuns objectContainingLocation: glyphIndex];
  if (theLine)
    {
      (NSRange*)effectiveRange = &theLine->glyphRange;
      return theLine->textContainer;
    }

  (NSRange*)effectiveRange = NULL;
  return nil;
}

//
// Handling line fragment rectangles 
//
// Associates the given line fragment bounds with the given range of glyphs.
- (void) setLineFragmentRect: (NSRect)fragmentRect
	       forGlyphRange: (NSRange)glyphRange
		    usedRect: (NSRect)usedRect
{
  GSLineLayoutInfo *aNewLine = [GSLineLayoutInfo new];

  aNewLine->glyphRange = glyphRange;
  aNewLine->lineFragmentRect = fragmentRect;
  aNewLine->usedRect = usedRect;

  [_fragmentRuns insertObject: aNewLine];
}

// Returns the rect for the line fragment in which the given glyph
// is laid and (optionally) by reference the whole range of glyphs
// that are in that fragment.  This will cause glyph generation AND layout as needed.
- (NSRect) lineFragmentRectForGlyphAtIndex: (unsigned)glyphIndex
			    effectiveRange: (NSRange*)lineFragmentRange
{
  GSLineLayoutInfo	*theLine;

  theLine = [_fragmentRuns objectContainingLocation: glyphIndex];
  if (theLine)
    {
      (NSRange*)lineFragmentRange = &theLine->glyphRange;
      return theLine->lineFragmentRect;
    }

  (NSRange*)lineFragmentRange = NULL;
  return NSZeroRect;
}

// Returns the usage rect for the line fragment in which the given
// glyph is laid and (optionally) by reference the whole range of
// glyphs that are in that fragment.  This will cause glyph generation
// AND layout as needed.
- (NSRect) lineFragmentUsedRectForGlyphAtIndex: (unsigned)glyphIndex
				effectiveRange: (NSRange*)lineFragmentRange
{
  GSLineLayoutInfo	*theLine;

  theLine = [_fragmentRuns objectContainingLocation: glyphIndex];
  if (theLine)
    {
      (NSRange*)lineFragmentRange = &theLine->glyphRange;
      return theLine->usedRect;
    }

  (NSRange*)lineFragmentRange = NULL;
  return NSZeroRect;
}

// Sets the bounds and container for the extra line fragment.  The extra line
// fragment is used when the text backing ends with a hard line break or when
// the text backing is totally empty to define the extra line which needs to
// be displayed.  If the text backing does not end with a hard line break this
// should be set to NSZeroRect and nil.
- (void) setExtraLineFragmentRect: (NSRect)aRect
			 usedRect: (NSRect)usedRect
		    textContainer: (NSTextContainer*)aTextContainer
{
}

// Return info about the extra line fragment.
- (NSRect) extraLineFragmentRect 
{
  return NSZeroRect;
}

- (NSRect) extraLineFragmentUsedRect 
{
  return NSZeroRect;
}

- (NSTextContainer*) extraLineFragmentTextContainer 
{
  return nil;
}

// Returns the container's currently used area.  This is the size that
// the view would need to be in order to display all the stuff that is
// currently laid into the container.  This causes no generation.
- (NSRect)usedRectForTextContainer:(NSTextContainer *)container
{
  return NSZeroRect;
}

- (void)setAttachmentSize:(NSSize)attachmentSize 
	    forGlyphRange:(NSRange)glyphRange
{
}

// Used to indicate that a particular glyph for some reason marks outside
// its line fragment bounding rect.  This can commonly happen if a fixed
// line height is used (consider a 12 point line height and a 24 point glyph).
- (void) setDrawsOutsideLineFragment: (BOOL)flag
		     forGlyphAtIndex: (unsigned)glyphIndex
{
}

// Returns whether the glyph will make marks outside its line fragment's bounds.
- (BOOL) drawsOutsideLineFragmentForGlyphAtIndex: (unsigned)glyphIndex
{
  return NO;
}

//
// Layout of glyphs 
//

// Sets the location to draw the first glyph of the given range at. 
// Setting the location for a glyph range implies that its first glyph
// is NOT nominally spaced with respect to the previous glyph.  When all
// is said and done all glyphs in the layoutManager should have been
// included in a range passed to this method.  But only glyphs which
// start a new nominal rtange should be at the start of such ranges. 
// Glyph locations are given relative the their line fragment bounding rect's origin.
- (void) setLocation: (NSPoint)aPoint
forStartOfGlyphRange: (NSRange)glyphRange
{
  GSGlyphLocation *aNewLine = [GSGlyphLocation new];

  aNewLine->glyphRange = glyphRange;
  aNewLine->point = aPoint;

  [_locationRuns insertObject: aNewLine];
}

// Returns the location that the given glyph will draw at.  If this glyph
// doesn't have an explicit location set for it (ie it is part of (but not
// first in) a sequence of nominally spaced characters), the location is
// calculated from the location of the last glyph with a location set. 
// Glyph locations are relative the their line fragment bounding rect's
// origin (see -lineFragmentForGlyphAtIndex:effectiveRange: below for
// finding line fragment bounding rects).  This will cause glyph generation
// AND layout as needed.
- (NSPoint) locationForGlyphAtIndex: (unsigned)glyphIndex
{
  return NSZeroPoint;
}

// Returns the range including the first glyph from glyphIndex on back
// that has a location set and up to, but not including the next glyph
// that has a location set.  This is a range of glyphs that can be shown
// with a single postscript show operation.
- (NSRange) rangeOfNominallySpacedGlyphsContainingIndex: (unsigned)glyphIndex
{
  GSLineLayoutInfo	*theLine;

  theLine = [_locationRuns objectContainingLocation: glyphIndex];

  if (theLine)
    {
      return theLine->glyphRange;
    }

  return NSMakeRange(NSNotFound, 0);
}

// Returns an array of NSRects and the number of rects by reference which
// define the region in container that encloses the given range.  If a
// selected range is given in the second argument, the rectangles returned
// will be correct for drawing the selection.  Selection rectangles are
// generally more complicated than enclosing rectangles and supplying a
// selected range is the clue these methods use to determine whether to
// go to the trouble of doing this special work. 
// If the caller is interested in this more from an enclosing point of
// view rather than a selection point of view pass {NSNotFound, 0} as 
// the selected range.  This method works hard to do the minimum amount
// of work required to answer the question.  The resulting array is owned
// by the layoutManager and will be reused when either of these two methods
// OR -boundingRectForGlyphRange:inTextContainer: is called.  Note that
// one of these methods may be called indirectly.  The upshot is that if
// you aren't going to use the rects right away, you should copy them to
// another location.
- (NSRect*) rectArrayForCharacterRange: (NSRange)charRange
          withinSelectedCharacterRange: (NSRange)selChareRange
                       inTextContainer: (NSTextContainer*)aTextContainer
                             rectCount: (unsigned*)rectCount
{
/*
  GSLineLayoutInfo *theLine = [GSLineLayoutInfo new];
  int position, lastPosition;
  int i, j = 0;

  theLine->glyphRange.location = charRange.location;

  position = GSIArrayInsertionPosition(lineFragments, (GSIArrayItem)theLine, aSort);

  if (position < 0)
    {
      return NULL;
    }

  theLine->glyphRange.location = charRange.location + charRange.length;

  lastPosition = GSIArrayInsertionPosition(lineFragments, (GSIArrayItem)theLine, aSort);

  if (lastPosition > 0)
    {
      _cachedRectArray = NSZoneRealloc([self zone], _cachedRectArray,
				(lastPosition - position) * sizeof(NSRect));

      _cachedRectArrayCapacity = lastPosition - position;

      for (i = position - 1; i < lastPosition - 1; i++)
        {
          GSLineLayoutInfo *aLine = GSIArrayItemAtIndex(lineFragments, i).obj;

	  _cachedRectArray[j] = aLine->lineFragmentRect;
	  j++;
        }
    }

  (*rectCount) = (position - 1 + lastPosition - 1);
  return _cachedRectArray;
*/
  return NULL;
}

- (NSRect*) rectArrayForGlyphRange: (NSRange)glyphRange
          withinSelectedGlyphRange: (NSRange)selectedGlyphRange
                   inTextContainer: (NSTextContainer*)aTextContainer
                         rectCount: (unsigned*)rectCount
{
  return _cachedRectArray;
}

// Returns the smallest bounding rect (in container coordinates) which
// completely encloses the glyphs in the given glyphRange that are in
// the given container.  If no container is given, then the container
// of the first glyph is assumed.  Basically, the range is intersected
// with the container's range before computing the bounding rect. 
// This method can be used to translate glyph ranges into display rectangles
// for invalidation.
- (NSRect) boundingRectForGlyphRange: (NSRange)glyphRange
		     inTextContainer: (NSTextContainer*)aTextContainer
{

/* Returns a single bounding rectangle enclosing all glyphs and other
marks drawn in aTextContainer for glyphRange, including glyphs that draw
outside their line fragment rectangles and text attributes such as
underlining. This method is useful for determining the area that needs to
be redrawn when a range of glyphs changes. */
/*
  unsigned rectCount;
  NSRect *rects = [self rectArrayForCharacterRange: [self glyphRangeForTextContainer: aTextContainer]
		      withinSelectedCharacterRange: NSMakeRange(0,0)
				   inTextContainer: aTextContainer
					 rectCount: &rectCount];
//  NSPoint aOrigin = [aTextContainer originPoint];
  NSRect rRect = NSZeroRect;
  int i;

  for (i=0;i<rectCount;i++)
    {
      NSRect aRect = rects[i];

      if (aRect.origin.y == rRect.size.height)
        rRect.size.height += aRect.size.width;

      if (rRect.size.width == aRect.origin.x)
        rRect.size.width += aRect.size.width;
    }

  return rRect;
*/
  return NSZeroRect;
}

// Returns the minimum contiguous glyph range that would need to be
// displayed in order to draw all glyphs that fall (even partially)
// within the bounding rect given.  This range might include glyphs
// which do not fall into the rect at all.  At most this will return
// the glyph range for the whole container.  The "WithoutFillingHoles"
// variant will not generate glyphs or perform layout in attempting to
// answer, and, thus, will potentially not be totally correct.
- (NSRange) glyphRangeForBoundingRect: (NSRect)aRect
		      inTextContainer: (NSTextContainer*)aTextContainer
{
  return NSMakeRange(0, 0);
}

- (NSRange) glyphRangeForBoundingRectWithoutAdditionalLayout: (NSRect)bounds
                           inTextContainer: (NSTextContainer*)aTextContainer
{
  return NSMakeRange(0, 0);
}

// Returns the index of the glyph which under the given point which is
// expressed in the given container's coordinate system.  If no glyph
// is under the point the "nearest" glyph is returned where "nearest"
// is defined in such a way that selection works like it should. 
// See the implementation for details.  partialFraction, if provided,
// is set to the fraction of the distance between the location of the
// glyph returned and the location of the next glyph that the point is at.
- (unsigned) glyphIndexForPoint: (NSPoint)aPoint
		inTextContainer: (NSTextContainer*)aTextContainer
 fractionOfDistanceThroughGlyph: (float*)partialFraction
{
  return 0;
}

- (unsigned)glyphIndexForPoint:(NSPoint)aPoint 
	       inTextContainer:(NSTextContainer *)aTextContainer
{
  return [self glyphIndexForPoint: aPoint
	       inTextContainer: aTextContainer
	       fractionOfDistanceThroughGlyph: NULL];
}

//
// Display of special glyphs 
//
// Some glyphs are not shown.  The typesetter decides which ones and
// sets this attribute in layoutManager where the view can find it.
- (void) setNotShownAttribute: (BOOL)flag
	      forGlyphAtIndex: (unsigned)glyphIndex
{
}

// Some glyphs are not shown.  This will cause glyph generation and layout as needed..
- (BOOL) notShownAttributeForGlyphAtIndex: (unsigned)glyphIndex
{
  return YES;
}

// If YES, and the rulebooks and fonts in use support it, whitespace and other 
// "invisible" unicodes will be shown with special glyphs (ie "." for space, 
// the little CR icon for new lines, etc...)
- (void) setShowsInvisibleCharacters: (BOOL)flag
{
  _showsInvisibleChars = flag;
}

- (BOOL) showsInvisibleCharacters 
{
  return _showsInvisibleChars;
}

// If YES, and the rulebooks and fonts in use support it, control characters 
// will be rendered visibly (usually like "^M", but possibly with special 
// glyphs if the the font and rulebook supports it).
- (void) setShowsControlCharacters: (BOOL)flag
{
  _showsControlChars = flag;
}

- (BOOL) showsControlCharacters
{
  return _showsControlChars;
}

//
// Controlling hyphenation 
//
- (void) setHyphenationFactor: (float)factor
{
  _hyphenationFactor = factor;
}

- (float) hyphenationFactor
{
  return _hyphenationFactor;
}

//
// Finding unlaid characters/glyphs 
//
// Returns (by reference) the character index or glyph index or both
// of the first unlaid character/glyph in the layout manager at this time.
- (void) getFirstUnlaidCharacterIndex: (unsigned*)charIndex
			   glyphIndex: (unsigned*)glyphIndex
{
  if (charIndex)
    *charIndex = [self firstUnlaidCharacterIndex];

  if (glyphIndex)
    *glyphIndex = [self firstUnlaidGlyphIndex];
}

- (unsigned int) firstUnlaidCharacterIndex
{
  return _firstUnlaidCharIndex;
}

- (unsigned int) firstUnlaidGlyphIndex
{
  return _firstUnlaidGlyphIndex;
}

//
// Using screen fonts 
//
// Sets whether this layoutManager will use screen fonts when it is possible to do so.
- (void) setUsesScreenFonts: (BOOL)flag
{
  _usesScreenFonts = flag;
}

- (BOOL) usesScreenFonts 
{
  return _usesScreenFonts;
}

// Returns a font to use in place of originalFont.  This method is used
// to substitute screen fonts for regular fonts.  If screen fonts are
// allowed AND no NSTextView managed by this layoutManager is scaled or
// rotated AND a screen font is available for originalFont, it is returned,
// otherwise originalFont is returned.  MF:??? This method will eventually
// need to know or be told whether use of screen fonts is appropriate in a
// given situation (ie screen font used might be enabled or disabled, we
// might be printing, etc...).  This method causes no generation.
- (NSFont*) substituteFontForFont: (NSFont*)originalFont
{
  NSFont *replaceFont;

  if (_usesScreenFonts)
    return originalFont;

  // FIXME: Should check if any NSTextView is scaled or rotated
  replaceFont = [originalFont screenFont];
  
  if (replaceFont != nil)
    return replaceFont;
  else
    return originalFont;    
}

//
// Handling rulers 
//
// These return, respectively, an array of text ruler objects for the
// current selection and the accessory view that the text system uses
// for ruler.  If you have turned off automatic ruler updating through
// the use of setUsesRulers: so that you can do more complex things,
// but you still want to display the appropriate text ruler objects
// and/or accessory view, you can use these methods.
- (NSView*) rulerAccessoryViewForTextView: (NSTextView*)aTextView
                           paragraphStyle: (NSParagraphStyle*)paragraphStyle
                                    ruler: (NSRulerView*)aRulerView
                                  enabled: (BOOL)flag
{
  return NULL;
}

- (NSArray*) rulerMarkersForTextView: (NSTextView*)aTextView
                      paragraphStyle: (NSParagraphStyle*)paragraphStyle
                               ruler: (NSRulerView*)aRulerView
{
  return NULL;
}

//
// Managing the responder chain 
//
// Returns YES if the firstResponder of the given window is one of
// the NSTextViews attached to this NSLayoutManager.
- (BOOL) layoutManagerOwnsFirstResponderInWindow: (NSWindow*)aWindow
{
  return NO;
}

- (NSTextView*) firstTextView 
{
  return [[_textContainers objectAtIndex: 0] textView];
}

// This method is special in that it won't cause layout if the
// beginning of the selected range is not yet laid out.  Other than
// that this method could be done through other API.
- (NSTextView*) textViewForBeginningOfSelection
{
  return NULL;
}

//
// Drawing 
//
- (void) drawBackgroundForGlyphRange: (NSRange)glyphRange
			     atPoint: (NSPoint)containerOrigin
{
}

// These methods are called by NSTextView to do drawing.  You can
// override these if you think you can draw the stuff any better
// (but not to change layout).  You can call them if you want, but
// focus must already be locked on the destination view or MF:???image?.
// -drawBackgroundGorGlyphRange:atPoint: should draw the background
// color and selection and marked range aspects of the text display. 
// -drawGlyphsForGlyphRange:atPoint: should draw the actual glyphs. 
// The point in either method is the container origin in the currently
// focused view's coordinates for the container the glyphs lie in.
- (void) drawGlyphsForGlyphRange: (NSRange)glyphRange
			 atPoint: (NSPoint)containerOrigin
{
  int firstPosition, lastPosition, i;

  for (i=0;i<[_fragmentRuns count];i++)
    {
/*
      GSLineLayoutInfo *info = [_fragmentRuns objectAtIndex: i];

      NSLog(@"i: %d glyphRange: (%d, %d) lineFragmentRect: (%f, %f) (%f, %f)",
i,
info->glyphRange.location,
info->glyphRange.length,
info->lineFragmentRect.origin.x,  
info->lineFragmentRect.origin.y,    
info->lineFragmentRect.size.width,  
info->lineFragmentRect.size.height);
*/
    }

  firstPosition = [_fragmentRuns indexOfObjectContainingLocation: glyphRange.location];
  lastPosition = [_fragmentRuns 
		     indexOfObjectContainingLocation: (glyphRange.location+glyphRange.length-3)];

  NSLog(@"glyphRange: (%d, %d) position1: %d position2: %d",
glyphRange.location, glyphRange.length, firstPosition, lastPosition);

  if (firstPosition >= 0)
    {
      if (lastPosition == -1)
        {
          lastPosition = [_fragmentRuns count] - 1; // FIXME
	  NSLog(@"fixed lastPosition: %d", lastPosition);
        }

      for (i = firstPosition; i <= lastPosition; i++)
        {
	  GSLineLayoutInfo *aLine = [_fragmentRuns objectAtIndex: i];
	  NSRect aRect = aLine->lineFragmentRect;
	  aRect.size.height -= 4;

/*
NSLog(@"drawRange: (%d, %d) inRect (%f, %f) (%f, %f)",
aLine->glyphRange.location,
aLine->glyphRange.length,
aLine->lineFragmentRect.origin.x,
aLine->lineFragmentRect.origin.y,
aLine->lineFragmentRect.size.width,
aLine->lineFragmentRect.size.height);

          NSEraseRect (aRect);
*/
	  [_textStorage drawRange: aLine->glyphRange inRect: aLine->lineFragmentRect];
        }
    }
}

- (void) drawUnderlineForGlyphRange: (NSRange)glyphRange
		      underlineType: (int)underlineType
		     baselineOffset: (float)baselineOffset
		   lineFragmentRect: (NSRect)lineRect
	     lineFragmentGlyphRange: (NSRange)lineGlyphRange
		    containerOrigin: (NSPoint)containerOrigin
{
}

// The first of these methods actually draws an appropriate underline
// for the glyph range given.  The second method potentailly breaks
// the range it is given up into subranges and calls drawUnderline...
// for ranges that should actually have the underline drawn.  As
// examples of why there are two methods, consider two situations. 
// First, in all cases you don't want to underline the leading and
// trailing whitespace on a line.  The -underlineGlyphRange... method
// is passed glyph ranges that have underlining turned on, but it will
// then look for this leading and trailing white space and only pass
// the ranges that should actually be underlined to -drawUnderline... 
// Second, if the underlineType: indicates that only words, (ie no
// whitespace), should be underlined, then -underlineGlyphRange... 
// will carve the range it is passed up into words and only pass word
// ranges to -drawUnderline.
- (void) underlineGlyphRange: (NSRange)glyphRange
	       underlineType: (int)underlineType
	    lineFragmentRect: (NSRect)lineRect
      lineFragmentGlyphRange: (NSRange)lineGlyphRange
	     containerOrigin: (NSPoint)containerOrigin
{
}

//
// Setting the delegate 
//
- (void) setDelegate: (id)aDelegate
{
  _delegate = aDelegate;
}

- (id) delegate
{
  return _delegate;
}

@end /* NSLayoutManager */

/* The methods laid out here are not correct, however the code they
contain for the most part is. Therefore, my country and a handsome gift of
Ghiradelli chocolate to he who puts all the pieces together : ) */

@implementation NSLayoutManager (Private)
- (int) _rebuildLayoutForTextContainer: (NSTextContainer*)aContainer
		  startingAtGlyphIndex: (int)glyphIndex
{
  NSSize cSize = [aContainer containerSize];
  float i = 0.0;
  NSMutableArray *lineStarts = [NSMutableArray new];
  NSMutableArray *lineEnds = [NSMutableArray new];
  int indexToAdd;
  NSScanner		*lineScanner;
  NSScanner		*paragraphScanner;
  BOOL lastLineForContainerReached = NO;
  int previousScanLocation;
  int previousParagraphLocation;
  int endScanLocation;
  int startIndex;
  NSRect firstProposedRect;
  NSRect secondProposedRect;
  NSCharacterSet *selectionParagraphGranularitySet = [NSCharacterSet characterSetWithCharactersInString: @"\n"];
  NSCharacterSet *selectionWordGranularitySet = [NSCharacterSet characterSetWithCharactersInString: @" "];
  NSCharacterSet *invSelectionWordGranularitySet = [selectionWordGranularitySet invertedSet];
  NSCharacterSet *invSelectionParagraphGranularitySet = [selectionParagraphGranularitySet invertedSet];
  NSRange paragraphRange;
  NSRange leadingSpacesRange;
  NSRange currentStringRange;
  NSRange trailingSpacesRange;
  NSRange leadingNlRange;
  NSRange trailingNlRange;
  NSSize lSize;
  float lineWidth = 0.0;
  float ourLines = 0.0;
  int beginLineIndex = 0;

  NSLog(@"rebuilding Layout at index: %d.\n", glyphIndex);

  // 1.) figure out how many glyphs we can fit in our container by
  // breaking up glyphs from the first unlaid out glyph and breaking it
  // into lines.
  //
  // 2.) 
  //     a.) set the range for the container
  //     b.) for each line in step 1 we need to set a lineFragmentRect and
  //         an origin point.


  // Here we go at part 1.

  startIndex = glyphIndex;

  paragraphScanner = [NSScanner scannerWithString: [_textStorage string]];
  [paragraphScanner setCharactersToBeSkipped: nil];

  [paragraphScanner setScanLocation: startIndex];

  NSLog(@"length of textStorage: %d", [[_textStorage string] length]);

//  NSLog(@"buffer: %@", [_textStorage string]);

  /*
   * This scanner eats one word at a time, we should have it imbeded in
   * another scanner that snacks on paragraphs (i.e. lines that end with
   * \n). Look in NSText.
   */
  while (![paragraphScanner isAtEnd])
    {
      previousParagraphLocation = [paragraphScanner scanLocation];
      beginLineIndex = previousParagraphLocation;
      lineWidth = 0.0;

      leadingNlRange
	= scanRange(paragraphScanner, selectionParagraphGranularitySet);
      paragraphRange
	= scanRange(paragraphScanner, invSelectionParagraphGranularitySet);
      trailingNlRange
	= scanRange(paragraphScanner, selectionParagraphGranularitySet);

//      NSLog(@"leadingNlRange: (%d, %d)", leadingNlRange.location, leadingNlRange.length);

//      if (leadingNlRange.length)
//	paragraphRange = NSUnionRange (leadingNlRange,paragraphRange);
//      if (trailingNlRange.length)
//	paragraphRange = NSUnionRange (trailingNlRange,paragraphRange);

      NSLog(@"paragraphRange: (%d, %d)", paragraphRange.location, paragraphRange.length);

      lineScanner = [NSScanner scannerWithString:
	[[_textStorage string] substringWithRange: paragraphRange]];
      [lineScanner setCharactersToBeSkipped: nil];

      while (![lineScanner isAtEnd])
        {
          previousScanLocation = [lineScanner scanLocation];

           // snack next word
          leadingSpacesRange
	    = scanRange(lineScanner, selectionWordGranularitySet);
          currentStringRange
	    = scanRange(lineScanner, invSelectionWordGranularitySet);
          trailingSpacesRange
	    = scanRange(lineScanner, selectionWordGranularitySet);

          if (leadingSpacesRange.length)
	    currentStringRange = NSUnionRange(leadingSpacesRange,currentStringRange);
          if (trailingSpacesRange.length)
	    currentStringRange = NSUnionRange(trailingSpacesRange,currentStringRange);

	  lSize = [_textStorage sizeRange: currentStringRange];

//	  lSize = [_textStorage sizeRange: 
//NSMakeRange(currentStringRange.location+paragraphRange.location+startIndex,
//currentStringRange.length)];

	  if ((lineWidth + lSize.width) < cSize.width)
	    {
	      if ([lineScanner isAtEnd])
                {
		  NSLog(@"we are at end before finishing a line: %d.\n",  [lineScanner scanLocation]);
		NSLog(@"scanLocation = %d, previousParagraphLocation = %d, beginLineIndex = %d",
[lineScanner scanLocation],
previousParagraphLocation,
beginLineIndex);
		  [lineStarts addObject: [NSNumber
numberWithInt: beginLineIndex]];
	          [lineEnds addObject: [NSNumber
numberWithInt: (int)[lineScanner scanLocation] + previousParagraphLocation - (beginLineIndex)]];
	          lineWidth = 0.0;
                }

	      lineWidth += lSize.width;
	      //NSLog(@"lineWidth: %f", lineWidth);
	    }
	  else
	    {
	      if (ourLines > cSize.height)
                {
                   lastLineForContainerReached = YES;
                   break;
                 }

	      [lineScanner setScanLocation: previousScanLocation];
	      indexToAdd = previousScanLocation + previousParagraphLocation 
		  - (beginLineIndex);

		NSLog(@"previousScanLocation = %d, previousParagraphLocation = %d, beginLineIndex = %d indexToAdd = %d",
previousScanLocation,
previousParagraphLocation,
beginLineIndex,
indexToAdd);

	      ourLines += 20.0;  // 14
	      lineWidth = 0.0;

	      [lineStarts addObject: [NSNumber
numberWithInt: beginLineIndex]];
	      [lineEnds addObject: [NSNumber numberWithInt: indexToAdd]];
	      beginLineIndex = previousScanLocation + previousParagraphLocation;
	    }
	}

      if (lastLineForContainerReached)
        break;
    }

  endScanLocation = [paragraphScanner scanLocation];

  NSLog(@"endScanLocation: %d", endScanLocation);

  // set this container for that glyphrange

  [self setTextContainer: aContainer
	forGlyphRange: NSMakeRange(startIndex, endScanLocation - startIndex)];

  NSLog(@"ok, move on to step 2.");

  // step 2. break the lines up and assign rects to them.

  for (i=0; i < [lineStarts count]; i++)
    {
      NSRect aRect, bRect;
      float padding = [aContainer lineFragmentPadding];
      NSRange ourRange;

//      NSLog(@"\t\t===> %d", [[lines objectAtIndex: i] intValue]);

      ourRange = NSMakeRange ([[lineStarts objectAtIndex: i] intValue],
			      [[lineEnds objectAtIndex: i] intValue]);

/*
      if (i == 0)
        {
          ourRange = NSMakeRange (startIndex, 
			[[lines objectAtIndex: i] intValue] - startIndex);
        }
      else
        {
          ourRange = NSMakeRange ([[lines objectAtIndex: i-1] intValue],
[[lines objectAtIndex: i] intValue] - [[lines objectAtIndex: i-1]
intValue]);
        }
*/
      NSLog(@"line: %@|", [[_textStorage string]
substringWithRange: ourRange]);

      firstProposedRect = NSMakeRect (0, i * 14, cSize.width, 14);

      // ask our textContainer to fix our lineFragment.

      secondProposedRect = [aContainer
	lineFragmentRectForProposedRect: firstProposedRect
                            sweepDirection: NSLineSweepLeft
                         movementDirection: NSLineMoveLeft
			     remainingRect: &bRect];

      // set the line fragmentRect for this range.

      [self setLineFragmentRect: secondProposedRect
		  forGlyphRange: ourRange
		       usedRect: aRect];

      // set the location for this string to be 'show'ed.

      [self setLocation: NSMakePoint(secondProposedRect.origin.x + padding,
				    secondProposedRect.origin.y + padding) 
	    forStartOfGlyphRange: ourRange];
    }

// bloody hack.
//      if (moreText)
//      	[delegate layoutManager: self
//	  didCompleteLayoutForTextContainer: [textContainers objectAtIndex: i]
//          atEnd: NO];
//      else
//      	[delegate layoutManager: self
//	  didCompleteLayoutForTextContainer: [textContainers objectAtIndex: i]
//          atEnd: YES];

  [lineStarts release];
  [lineEnds release];

  return endScanLocation;
}

- (void) _doLayout
{
  NSEnumerator		*enumerator;
  NSTextContainer	*container;
  int			gIndex = 0;

  NSLog(@"doLayout called.\n");

  enumerator = [_textContainers objectEnumerator];
  while ((container = [enumerator nextObject]) != nil)
    {
      gIndex = [self _rebuildLayoutForTextContainer: container
			       startingAtGlyphIndex: gIndex];
    }
}

@end
