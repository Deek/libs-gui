/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_GSRTF_RTFGRAMMAR_TAB_H_INCLUDED
# define YY_GSRTF_RTFGRAMMAR_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int GSRTFdebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    RTFtext = 258,
    RTFstart = 259,
    RTFansi = 260,
    RTFmac = 261,
    RTFnext = 262,
    RTFpc = 263,
    RTFpca = 264,
    RTFignore = 265,
    RTFinfo = 266,
    RTFstylesheet = 267,
    RTFfootnote = 268,
    RTFheader = 269,
    RTFfooter = 270,
    RTFpict = 271,
    RTFplain = 272,
    RTFparagraph = 273,
    RTFdefaultParagraph = 274,
    RTFrow = 275,
    RTFcell = 276,
    RTFtabulator = 277,
    RTFemdash = 278,
    RTFendash = 279,
    RTFemspace = 280,
    RTFenspace = 281,
    RTFbullet = 282,
    RTFfield = 283,
    RTFfldinst = 284,
    RTFfldalt = 285,
    RTFfldrslt = 286,
    RTFflddirty = 287,
    RTFfldedit = 288,
    RTFfldlock = 289,
    RTFfldpriv = 290,
    RTFfttruetype = 291,
    RTFlquote = 292,
    RTFqmspace = 293,
    RTFrquote = 294,
    RTFldblquote = 295,
    RTFrdblquote = 296,
    RTFunderscore = 297,
    RTFansicpg = 298,
    RTFred = 299,
    RTFgreen = 300,
    RTFblue = 301,
    RTFcolorbg = 302,
    RTFcolorfg = 303,
    RTFunderlinecolor = 304,
    RTFcolortable = 305,
    RTFfont = 306,
    RTFfontSize = 307,
    RTFNeXTGraphic = 308,
    RTFNeXTGraphicWidth = 309,
    RTFNeXTGraphicHeight = 310,
    RTFNeXTHelpLink = 311,
    RTFNeXTHelpMarker = 312,
    RTFNeXTfilename = 313,
    RTFNeXTmarkername = 314,
    RTFNeXTlinkFilename = 315,
    RTFNeXTlinkMarkername = 316,
    RTFpaperWidth = 317,
    RTFpaperHeight = 318,
    RTFmarginLeft = 319,
    RTFmarginRight = 320,
    RTFmarginTop = 321,
    RTFmarginButtom = 322,
    RTFfirstLineIndent = 323,
    RTFleftIndent = 324,
    RTFrightIndent = 325,
    RTFalignCenter = 326,
    RTFalignJustified = 327,
    RTFalignLeft = 328,
    RTFalignRight = 329,
    RTFlineSpace = 330,
    RTFspaceAbove = 331,
    RTFstyle = 332,
    RTFbold = 333,
    RTFitalic = 334,
    RTFunderline = 335,
    RTFunderlineDot = 336,
    RTFunderlineDash = 337,
    RTFunderlineDashDot = 338,
    RTFunderlineDashDotDot = 339,
    RTFunderlineDouble = 340,
    RTFunderlineStop = 341,
    RTFunderlineThick = 342,
    RTFunderlineThickDot = 343,
    RTFunderlineThickDash = 344,
    RTFunderlineThickDashDot = 345,
    RTFunderlineThickDashDotDot = 346,
    RTFunderlineWord = 347,
    RTFstrikethrough = 348,
    RTFstrikethroughDouble = 349,
    RTFunichar = 350,
    RTFsubscript = 351,
    RTFsuperscript = 352,
    RTFtabstop = 353,
    RTFfcharset = 354,
    RTFfprq = 355,
    RTFcpg = 356,
    RTFOtherStatement = 357,
    RTFfontListStart = 358,
    RTFfamilyNil = 359,
    RTFfamilyRoman = 360,
    RTFfamilySwiss = 361,
    RTFfamilyModern = 362,
    RTFfamilyScript = 363,
    RTFfamilyDecor = 364,
    RTFfamilyTech = 365,
    RTFfamilyBiDi = 366
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 90 "rtfGrammar.y" /* yacc.c:1909  */

	int		number;
	const char	*text;
	RTFcmd		cmd;

#line 172 "rtfGrammar.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif



int GSRTFparse (void *ctxt, void *lctxt);

#endif /* !YY_GSRTF_RTFGRAMMAR_TAB_H_INCLUDED  */
