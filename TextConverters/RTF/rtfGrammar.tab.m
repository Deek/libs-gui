/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 2

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1


/* Substitute the variable and function names.  */
#define yyparse         GSRTFparse
#define yylex           GSRTFlex
#define yyerror         GSRTFerror
#define yydebug         GSRTFdebug
#define yynerrs         GSRTFnerrs


/* Copy the first part of user declarations.  */
#line 37 "rtfGrammar.y" /* yacc.c:339  */


/*
  The overall plan is to make this grammer universal in usage.
  Intrested buddies can implement plain C functions to consume what
  the grammer is producing. this way the rtf-grammer-tree can be
  converted to what is needed: GNUstep attributed strings, tex files,
  ...
  
  The plan is laid out by defining a set of C functions which cover
  all what is needed to mangle rtf information (it is NeXT centric
  however and may even lack some features).  Be aware that some
  functions are called at specific times when some information may or
  may not be available. The first argument of all functions is a
  context, which is asked to be maintained by the consumer at
  whichever purpose seems appropriate.  This context must be passed to
  the parser by issuing 'value = GSRTFparse(ctxt, lctxt);' in the
  first place.
*/

#import <AppKit/AppKit.h>
#include <stdlib.h>
#include <string.h>
#include "rtfScanner.h"

/*	this context is passed to the interface functions	*/
typedef void	*GSRTFctxt;
// Two parameters are not supported by some bison versions. The declaration of 
// yyparse in the .c file must be corrected to be able to compile it.
/*#define YYPARSE_PARAM	ctxt, void *lctxt*/
#define YYLEX_PARAM		lctxt
//#define YYLSP_NEEDED


#define CTXT            ctxt

#define	YYERROR_VERBOSE
#define YYDEBUG 1

#include "RTFConsumerFunctions.h"

int GSRTFlex(void *lvalp, RTFscannerCtxt *lctxt);

/* */
int fieldStart = 0;


#line 120 "rtfGrammar.tab.m" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* In a future release of Bison, this section will be replaced
   by #include "rtfGrammar.tab.h".  */
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
#line 90 "rtfGrammar.y" /* yacc.c:355  */

	int		number;
	const char	*text;
	RTFcmd		cmd;

#line 278 "rtfGrammar.tab.m" /* yacc.c:355  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif



int GSRTFparse (void *ctxt, void *lctxt);

#endif /* !YY_GSRTF_RTFGRAMMAR_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 292 "rtfGrammar.tab.m" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1821

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  114
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  45
/* YYNRULES -- Number of rules.  */
#define YYNRULES  156
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  231

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   366

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,   112,     2,   113,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   218,   218,   218,   218,   222,   223,   224,   225,   226,
     229,   230,   231,   232,   233,   234,   235,   236,   239,   239,
     240,   240,   241,   241,   242,   242,   243,   243,   244,   244,
     245,   245,   246,   246,   247,   247,   248,   252,   252,   253,
     256,   257,   258,   259,   260,   263,   264,   267,   268,   268,
     268,   269,   272,   273,   276,   277,   280,   281,   282,   289,
     296,   303,   310,   317,   324,   331,   338,   345,   352,   359,
     366,   373,   374,   375,   376,   377,   384,   385,   386,   387,
     392,   399,   406,   413,   420,   427,   434,   441,   448,   455,
     462,   469,   476,   483,   484,   491,   498,   505,   512,   519,
     526,   532,   533,   534,   535,   536,   537,   538,   539,   540,
     541,   542,   543,   544,   545,   546,   547,   548,   552,   553,
     554,   555,   567,   567,   567,   582,   582,   582,   596,   596,
     596,   605,   608,   609,   610,   611,   617,   620,   623,   627,
     628,   629,   630,   631,   632,   637,   638,   639,   640,   641,
     642,   643,   651,   654,   655,   659,   664
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "RTFtext", "RTFstart", "RTFansi",
  "RTFmac", "RTFnext", "RTFpc", "RTFpca", "RTFignore", "RTFinfo",
  "RTFstylesheet", "RTFfootnote", "RTFheader", "RTFfooter", "RTFpict",
  "RTFplain", "RTFparagraph", "RTFdefaultParagraph", "RTFrow", "RTFcell",
  "RTFtabulator", "RTFemdash", "RTFendash", "RTFemspace", "RTFenspace",
  "RTFbullet", "RTFfield", "RTFfldinst", "RTFfldalt", "RTFfldrslt",
  "RTFflddirty", "RTFfldedit", "RTFfldlock", "RTFfldpriv", "RTFfttruetype",
  "RTFlquote", "RTFqmspace", "RTFrquote", "RTFldblquote", "RTFrdblquote",
  "RTFunderscore", "RTFansicpg", "RTFred", "RTFgreen", "RTFblue",
  "RTFcolorbg", "RTFcolorfg", "RTFunderlinecolor", "RTFcolortable",
  "RTFfont", "RTFfontSize", "RTFNeXTGraphic", "RTFNeXTGraphicWidth",
  "RTFNeXTGraphicHeight", "RTFNeXTHelpLink", "RTFNeXTHelpMarker",
  "RTFNeXTfilename", "RTFNeXTmarkername", "RTFNeXTlinkFilename",
  "RTFNeXTlinkMarkername", "RTFpaperWidth", "RTFpaperHeight",
  "RTFmarginLeft", "RTFmarginRight", "RTFmarginTop", "RTFmarginButtom",
  "RTFfirstLineIndent", "RTFleftIndent", "RTFrightIndent",
  "RTFalignCenter", "RTFalignJustified", "RTFalignLeft", "RTFalignRight",
  "RTFlineSpace", "RTFspaceAbove", "RTFstyle", "RTFbold", "RTFitalic",
  "RTFunderline", "RTFunderlineDot", "RTFunderlineDash",
  "RTFunderlineDashDot", "RTFunderlineDashDotDot", "RTFunderlineDouble",
  "RTFunderlineStop", "RTFunderlineThick", "RTFunderlineThickDot",
  "RTFunderlineThickDash", "RTFunderlineThickDashDot",
  "RTFunderlineThickDashDotDot", "RTFunderlineWord", "RTFstrikethrough",
  "RTFstrikethroughDouble", "RTFunichar", "RTFsubscript", "RTFsuperscript",
  "RTFtabstop", "RTFfcharset", "RTFfprq", "RTFcpg", "RTFOtherStatement",
  "RTFfontListStart", "RTFfamilyNil", "RTFfamilyRoman", "RTFfamilySwiss",
  "RTFfamilyModern", "RTFfamilyScript", "RTFfamilyDecor", "RTFfamilyTech",
  "RTFfamilyBiDi", "'{'", "'}'", "$accept", "rtfFile", "$@1", "$@2",
  "rtfCharset", "rtfIngredients", "rtfBlock", "$@3", "$@4", "$@5", "$@6",
  "$@7", "$@8", "$@9", "$@10", "$@11", "rtfField", "$@12", "rtfFieldMod",
  "rtfIgnore", "rtfFieldinst", "$@13", "$@14", "rtfFieldalt",
  "rtfFieldrslt", "rtfStatementList", "rtfStatement", "rtfNeXTstuff",
  "rtfNeXTGraphic", "$@15", "$@16", "rtfNeXTHelpLink", "$@17", "$@18",
  "rtfNeXTHelpMarker", "$@19", "$@20", "rtfFontList", "rtfFonts",
  "rtfFontStatement", "rtfFontAttrs", "rtfFontFamily", "rtfColorDef",
  "rtfColors", "rtfColorStatement", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   123,   125
};
# endif

#define YYPACT_NINF -145

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-145)))

#define YYTABLE_NINF -130

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -90,  -145,    27,    24,  -145,  -145,   411,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,   200,   -84,  -145,  -145,  -145,  -145,  -145,
     -82,  -145,  -145,  -145,    20,    29,    23,    39,    40,    38,
      44,    28,  -145,  -145,     6,   -45,   509,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,     4,  -145,    10,  -145,  -145,   -35,
      12,   -44,  -145,  -145,    87,   -52,  -145,  -145,  -145,   607,
     705,   803,   901,   999,  1097,  1195,  -145,   -51,  -145,    18,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,   -61,  -145,   -46,
     -88,    63,    19,    21,  -145,  -145,  -145,  -145,  -145,  -145,
    -145,  -145,  -145,   -31,    74,  -145,  1692,   -61,   313,  -145,
      76,    30,    79,    80,  -145,  -145,  -145,  -145,    22,   -27,
    -145,  1702,  -145,  -145,  -145,  -145,  -145,  -145,  -145,   -24,
      31,    48,   -22,    -4,  -145,    91,    11,  -145,  -145,  1709,
    -145,     8,   128,  -145,  -145,     5,    32,   101,  -145,  -145,
      72,  -145,   112,  -145,  -145,  -145,  -145,   143,  1293,  -145,
      34,  -145,  1391,  1489,    35,  -145,  -145,  1684,  -145,  -145,
    -145,   112,  -145,  -145,  -145,    73,  1587,  -145,  -145,    75,
    -145
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     2,     0,     0,     1,    10,     0,    17,    15,     5,
       6,     9,     7,     8,   103,   104,    77,   105,   107,   108,
     109,   110,   106,   112,   111,   113,   114,   115,   116,    79,
      80,    81,    82,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    71,    72,    73,    74,    76,    75,
      78,    85,    86,    87,    88,    89,    90,    91,    92,    93,
      94,    95,    96,    97,    98,    99,   100,   101,   102,    83,
      84,    70,   117,     0,     0,    11,    16,    14,    12,    13,
       0,   153,   132,    10,     0,     0,     0,     0,     0,     0,
       0,     0,     4,    36,     0,     0,     0,    10,    10,    10,
      10,    10,    10,    10,     0,   156,     0,   152,   154,     0,
       0,     0,   131,   133,     0,     0,   119,   120,   121,     0,
       0,     0,     0,     0,     0,     0,    39,     0,    40,     0,
     145,   146,   147,   148,   149,   150,   151,     0,   139,     0,
       0,     0,     0,     0,    19,    21,    23,    25,    27,    29,
      31,    33,    35,     0,     0,   139,     0,     0,     0,   134,
       0,     0,     0,     0,    41,    42,    43,    44,     0,     0,
     155,     0,   136,   143,   140,   141,   142,   144,   139,     0,
       0,     0,     0,     0,    46,     0,     0,    38,   137,     0,
     135,     0,     0,   128,    51,     0,     0,     0,   138,   122,
       0,    10,    52,    48,    55,    10,    10,     0,     0,    53,
       0,    56,     0,     0,     0,   130,    47,     0,    54,   124,
     125,    52,    58,    57,    10,     0,     0,    49,   127,     0,
      50
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -145,  -145,  -145,  -145,  -145,   -83,  -130,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,     1,
    -145,  -145,  -145,   -30,  -145,  -145,   -25,  -145,  -145,  -145,
    -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,  -145,    82,
    -144,  -124,  -145,  -145,  -145
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     2,     3,    74,    75,     6,    76,    83,    84,    85,
      86,    87,    88,    89,    90,    91,   127,   128,   153,   185,
     169,   211,   229,   210,   187,   217,    77,   115,   116,   206,
     219,   117,   224,   228,   118,   201,   215,    78,    95,   113,
     156,   138,    79,    94,   108
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      96,   164,   165,   166,   167,   126,   109,   109,   202,   105,
     160,   171,   196,   155,   119,   120,   121,   122,   123,   124,
     125,   184,     1,   183,   158,   159,   177,     4,     5,    92,
      97,    93,   184,   178,   189,    99,   -37,   -37,   -37,   -37,
      98,   177,   -45,   130,   131,   132,   133,   134,   135,   136,
     106,   -45,   100,   102,   101,   129,   104,   110,   110,   177,
     103,   144,   152,   139,   154,   157,   161,   111,   112,   130,
     131,   132,   133,   134,   135,   136,   137,   170,   162,   179,
     163,   168,   181,   182,   180,   186,   191,   222,    80,   190,
     -18,   193,   -18,   -18,   -18,   -18,   -18,   -20,   -22,   -24,
     -26,   -28,   -30,   -32,   -18,   -18,   -18,   -18,   192,   194,
     -18,   -18,   -18,   -18,   -18,   -34,   -37,   203,   208,   107,
     195,   199,   212,   213,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   200,   205,   207,   -18,   -18,   -18,    81,   -18,   -18,
     141,   226,   209,   142,   143,   204,   214,   216,   220,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   227,   197,   230,   -18,
      82,   225,   223,   140,     0,     0,     0,     0,     0,   -18,
     -18,    80,     0,   -18,     0,   -18,   -18,   -18,   -18,   -18,
     -20,   -22,   -24,   -26,   -28,   -30,   -32,   -18,   -18,   -18,
     -18,     0,     0,   -18,   -18,   -18,   -18,   -18,   -34,     0,
       0,     0,     0,     0,     0,     0,     0,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,     0,     0,     0,   -18,   -18,   -18,
      81,   -18,   -18,     0,     0,     0,     0,     0,     0,     0,
       0,     0,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,     0,
       0,     0,   -18,    82,     0,     0,     0,     0,     0,     0,
       0,     0,   -18,   -18,    80,     0,   -18,     0,   -18,   -18,
     -18,   -18,   -18,   -20,   -22,   -24,   -26,   -28,   -30,   -32,
     -18,   -18,   -18,   -18,     0,     0,   -18,   -18,   -18,   -18,
     -18,   -34,     0,     0,     0,     0,     0,     0,     0,     0,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,     0,     0,     0,
     -18,   -18,   -18,     0,   -18,   -18,     0,     0,     0,     0,
       0,     0,     0,     0,     0,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,   -18,
     -18,   -18,     7,     0,     8,   -18,     9,    10,    11,    12,
      13,     0,     0,     0,     0,   -18,   -18,     0,    14,    15,
      16,    17,     0,     0,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    23,    24,
      25,    26,    27,    28,    29,     0,     0,     0,    30,    31,
      32,     0,    33,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
       7,     0,     8,    72,     9,    10,    11,    12,    13,     0,
       0,     0,     0,    73,    -3,     0,    14,    15,    16,    17,
       0,     0,    18,    19,    20,    21,    22,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    23,    24,    25,    26,
      27,    28,    29,     0,     0,     0,    30,    31,    32,     0,
      33,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,     7,     0,
       8,    72,     9,    10,    11,    12,    13,     0,     0,     0,
       0,   114,  -118,     0,    14,    15,    16,    17,     0,     0,
      18,    19,    20,    21,    22,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    23,    24,    25,    26,    27,    28,
      29,     0,     0,     0,    30,    31,    32,     0,    33,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,     7,     0,     8,    72,
       9,    10,    11,    12,    13,     0,     0,     0,     0,    73,
     145,     0,    14,    15,    16,    17,     0,     0,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    23,    24,    25,    26,    27,    28,    29,     0,
       0,     0,    30,    31,    32,     0,    33,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,     7,     0,     8,    72,     9,    10,
      11,    12,    13,     0,     0,     0,     0,    73,   146,     0,
      14,    15,    16,    17,     0,     0,    18,    19,    20,    21,
      22,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      23,    24,    25,    26,    27,    28,    29,     0,     0,     0,
      30,    31,    32,     0,    33,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,     7,     0,     8,    72,     9,    10,    11,    12,
      13,     0,     0,     0,     0,    73,   147,     0,    14,    15,
      16,    17,     0,     0,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    23,    24,
      25,    26,    27,    28,    29,     0,     0,     0,    30,    31,
      32,     0,    33,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
       7,     0,     8,    72,     9,    10,    11,    12,    13,     0,
       0,     0,     0,    73,   148,     0,    14,    15,    16,    17,
       0,     0,    18,    19,    20,    21,    22,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    23,    24,    25,    26,
      27,    28,    29,     0,     0,     0,    30,    31,    32,     0,
      33,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,     7,     0,
       8,    72,     9,    10,    11,    12,    13,     0,     0,     0,
       0,    73,   149,     0,    14,    15,    16,    17,     0,     0,
      18,    19,    20,    21,    22,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    23,    24,    25,    26,    27,    28,
      29,     0,     0,     0,    30,    31,    32,     0,    33,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,     7,     0,     8,    72,
       9,    10,    11,    12,    13,     0,     0,     0,     0,    73,
     150,     0,    14,    15,    16,    17,     0,     0,    18,    19,
      20,    21,    22,     0,     0,     0,     0,     0,     0,     0,
       0,     0,    23,    24,    25,    26,    27,    28,    29,     0,
       0,     0,    30,    31,    32,     0,    33,    34,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    35,    36,    37,
      38,    39,    40,    41,    42,    43,    44,    45,    46,    47,
      48,    49,    50,    51,    52,    53,    54,    55,    56,    57,
      58,    59,    60,    61,    62,    63,    64,    65,    66,    67,
      68,    69,    70,    71,     7,     0,     8,    72,     9,    10,
      11,    12,    13,     0,     0,     0,     0,    73,   151,     0,
      14,    15,    16,    17,     0,     0,    18,    19,    20,    21,
      22,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      23,    24,    25,    26,    27,    28,    29,     0,     0,     0,
      30,    31,    32,     0,    33,    34,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    35,    36,    37,    38,    39,
      40,    41,    42,    43,    44,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,    58,    59,
      60,    61,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,     7,     0,     8,    72,     9,    10,    11,    12,
      13,     0,     0,     0,     0,    73,  -129,     0,    14,    15,
      16,    17,     0,     0,    18,    19,    20,    21,    22,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    23,    24,
      25,    26,    27,    28,    29,     0,     0,     0,    30,    31,
      32,     0,    33,    34,     0,     0,     0,     0,     0,     0,
       0,     0,     0,    35,    36,    37,    38,    39,    40,    41,
      42,    43,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    53,    54,    55,    56,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    68,    69,    70,    71,
       7,     0,     8,    72,     9,    10,    11,    12,    13,     0,
       0,     0,     0,    73,   218,     0,    14,    15,    16,    17,
       0,     0,    18,    19,    20,    21,    22,     0,     0,     0,
       0,     0,     0,     0,     0,     0,    23,    24,    25,    26,
      27,    28,    29,     0,     0,     0,    30,    31,    32,     0,
      33,    34,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    35,    36,    37,    38,    39,    40,    41,    42,    43,
      44,    45,    46,    47,    48,    49,    50,    51,    52,    53,
      54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
      64,    65,    66,    67,    68,    69,    70,    71,     7,     0,
       8,    72,     9,    10,    11,    12,    13,     0,     0,     0,
       0,    73,  -123,     0,    14,    15,    16,    17,     0,     0,
      18,    19,    20,    21,    22,     0,     0,     0,     0,     0,
       0,     0,     0,     0,    23,    24,    25,    26,    27,    28,
      29,     0,     0,     0,    30,    31,    32,     0,    33,    34,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    35,
      36,    37,    38,    39,    40,    41,    42,    43,    44,    45,
      46,    47,    48,    49,    50,    51,    52,    53,    54,    55,
      56,    57,    58,    59,    60,    61,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,     0,   221,     0,    72,
       0,     0,     0,     0,     0,   172,     0,     0,     0,    73,
    -126,    14,    15,    16,    17,   188,     0,    18,    19,    20,
      21,    22,   198,     0,     0,     0,     0,     0,     0,     0,
       0,    23,    24,    25,    26,    27,    28,    29,   173,     0,
       0,    30,    31,    32,     0,    33,    34,     0,   173,     0,
       0,     0,     0,     0,     0,   173,    35,    36,    37,    38,
      39,    40,    41,    42,    43,    44,    45,    46,    47,    48,
      49,    50,    51,    52,    53,    54,    55,    56,    57,    58,
      59,    60,    61,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,     0,     0,     0,    72,     0,     0,     0,
       0,   174,   175,   176,     0,     0,   158,     0,     0,     0,
       0,   174,   175,   176,   158,     0,     0,     0,   174,   175,
     176,     0,     0,     0,   158,     0,     0,     0,     0,     0,
       0,   158
};

static const yytype_int16 yycheck[] =
{
      83,    32,    33,    34,    35,     1,    51,    51,     3,     3,
     140,   155,     1,   137,    97,    98,    99,   100,   101,   102,
     103,    10,   112,     1,   112,   113,   156,     0,     4,   113,
      10,   113,    10,   157,   178,    12,    32,    33,    34,    35,
      11,   171,    31,   104,   105,   106,   107,   108,   109,   110,
      44,    29,    13,    15,    14,    45,    28,   102,   102,   189,
      16,   113,   113,    51,    46,   111,     3,   112,   113,   104,
     105,   106,   107,   108,   109,   110,   111,     3,    59,     3,
      59,   112,     3,     3,    54,   112,    55,   217,     1,   113,
       3,   113,     5,     6,     7,     8,     9,    10,    11,    12,
      13,    14,    15,    16,    17,    18,    19,    20,    60,   113,
      23,    24,    25,    26,    27,    28,   112,   112,   201,   113,
      29,   113,   205,   206,    37,    38,    39,    40,    41,    42,
      43,     3,    31,    61,    47,    48,    49,    50,    51,    52,
      53,   224,    30,    56,    57,   113,     3,   113,   113,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,   113,   186,   113,   102,
     103,   221,   217,   111,    -1,    -1,    -1,    -1,    -1,   112,
     113,     1,    -1,     3,    -1,     5,     6,     7,     8,     9,
      10,    11,    12,    13,    14,    15,    16,    17,    18,    19,
      20,    -1,    -1,    23,    24,    25,    26,    27,    28,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    37,    38,    39,
      40,    41,    42,    43,    -1,    -1,    -1,    47,    48,    49,
      50,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    62,    63,    64,    65,    66,    67,    68,    69,
      70,    71,    72,    73,    74,    75,    76,    77,    78,    79,
      80,    81,    82,    83,    84,    85,    86,    87,    88,    89,
      90,    91,    92,    93,    94,    95,    96,    97,    98,    -1,
      -1,    -1,   102,   103,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,   112,   113,     1,    -1,     3,    -1,     5,     6,
       7,     8,     9,    10,    11,    12,    13,    14,    15,    16,
      17,    18,    19,    20,    -1,    -1,    23,    24,    25,    26,
      27,    28,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      37,    38,    39,    40,    41,    42,    43,    -1,    -1,    -1,
      47,    48,    49,    -1,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,     1,    -1,     3,   102,     5,     6,     7,     8,
       9,    -1,    -1,    -1,    -1,   112,   113,    -1,    17,    18,
      19,    20,    -1,    -1,    23,    24,    25,    26,    27,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    37,    38,
      39,    40,    41,    42,    43,    -1,    -1,    -1,    47,    48,
      49,    -1,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
       1,    -1,     3,   102,     5,     6,     7,     8,     9,    -1,
      -1,    -1,    -1,   112,   113,    -1,    17,    18,    19,    20,
      -1,    -1,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    37,    38,    39,    40,
      41,    42,    43,    -1,    -1,    -1,    47,    48,    49,    -1,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,     1,    -1,
       3,   102,     5,     6,     7,     8,     9,    -1,    -1,    -1,
      -1,   112,   113,    -1,    17,    18,    19,    20,    -1,    -1,
      23,    24,    25,    26,    27,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    37,    38,    39,    40,    41,    42,
      43,    -1,    -1,    -1,    47,    48,    49,    -1,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     1,    -1,     3,   102,
       5,     6,     7,     8,     9,    -1,    -1,    -1,    -1,   112,
     113,    -1,    17,    18,    19,    20,    -1,    -1,    23,    24,
      25,    26,    27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    37,    38,    39,    40,    41,    42,    43,    -1,
      -1,    -1,    47,    48,    49,    -1,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,     1,    -1,     3,   102,     5,     6,
       7,     8,     9,    -1,    -1,    -1,    -1,   112,   113,    -1,
      17,    18,    19,    20,    -1,    -1,    23,    24,    25,    26,
      27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      37,    38,    39,    40,    41,    42,    43,    -1,    -1,    -1,
      47,    48,    49,    -1,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,     1,    -1,     3,   102,     5,     6,     7,     8,
       9,    -1,    -1,    -1,    -1,   112,   113,    -1,    17,    18,
      19,    20,    -1,    -1,    23,    24,    25,    26,    27,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    37,    38,
      39,    40,    41,    42,    43,    -1,    -1,    -1,    47,    48,
      49,    -1,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
       1,    -1,     3,   102,     5,     6,     7,     8,     9,    -1,
      -1,    -1,    -1,   112,   113,    -1,    17,    18,    19,    20,
      -1,    -1,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    37,    38,    39,    40,
      41,    42,    43,    -1,    -1,    -1,    47,    48,    49,    -1,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,     1,    -1,
       3,   102,     5,     6,     7,     8,     9,    -1,    -1,    -1,
      -1,   112,   113,    -1,    17,    18,    19,    20,    -1,    -1,
      23,    24,    25,    26,    27,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    37,    38,    39,    40,    41,    42,
      43,    -1,    -1,    -1,    47,    48,    49,    -1,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,     1,    -1,     3,   102,
       5,     6,     7,     8,     9,    -1,    -1,    -1,    -1,   112,
     113,    -1,    17,    18,    19,    20,    -1,    -1,    23,    24,
      25,    26,    27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    37,    38,    39,    40,    41,    42,    43,    -1,
      -1,    -1,    47,    48,    49,    -1,    51,    52,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,     1,    -1,     3,   102,     5,     6,
       7,     8,     9,    -1,    -1,    -1,    -1,   112,   113,    -1,
      17,    18,    19,    20,    -1,    -1,    23,    24,    25,    26,
      27,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      37,    38,    39,    40,    41,    42,    43,    -1,    -1,    -1,
      47,    48,    49,    -1,    51,    52,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,     1,    -1,     3,   102,     5,     6,     7,     8,
       9,    -1,    -1,    -1,    -1,   112,   113,    -1,    17,    18,
      19,    20,    -1,    -1,    23,    24,    25,    26,    27,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    37,    38,
      39,    40,    41,    42,    43,    -1,    -1,    -1,    47,    48,
      49,    -1,    51,    52,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    62,    63,    64,    65,    66,    67,    68,
      69,    70,    71,    72,    73,    74,    75,    76,    77,    78,
      79,    80,    81,    82,    83,    84,    85,    86,    87,    88,
      89,    90,    91,    92,    93,    94,    95,    96,    97,    98,
       1,    -1,     3,   102,     5,     6,     7,     8,     9,    -1,
      -1,    -1,    -1,   112,   113,    -1,    17,    18,    19,    20,
      -1,    -1,    23,    24,    25,    26,    27,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    37,    38,    39,    40,
      41,    42,    43,    -1,    -1,    -1,    47,    48,    49,    -1,
      51,    52,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    62,    63,    64,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    76,    77,    78,    79,    80,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      91,    92,    93,    94,    95,    96,    97,    98,     1,    -1,
       3,   102,     5,     6,     7,     8,     9,    -1,    -1,    -1,
      -1,   112,   113,    -1,    17,    18,    19,    20,    -1,    -1,
      23,    24,    25,    26,    27,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    37,    38,    39,    40,    41,    42,
      43,    -1,    -1,    -1,    47,    48,    49,    -1,    51,    52,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    62,
      63,    64,    65,    66,    67,    68,    69,    70,    71,    72,
      73,    74,    75,    76,    77,    78,    79,    80,    81,    82,
      83,    84,    85,    86,    87,    88,    89,    90,    91,    92,
      93,    94,    95,    96,    97,    98,    -1,     3,    -1,   102,
      -1,    -1,    -1,    -1,    -1,     3,    -1,    -1,    -1,   112,
     113,    17,    18,    19,    20,     3,    -1,    23,    24,    25,
      26,    27,     3,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    37,    38,    39,    40,    41,    42,    43,    36,    -1,
      -1,    47,    48,    49,    -1,    51,    52,    -1,    36,    -1,
      -1,    -1,    -1,    -1,    -1,    36,    62,    63,    64,    65,
      66,    67,    68,    69,    70,    71,    72,    73,    74,    75,
      76,    77,    78,    79,    80,    81,    82,    83,    84,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,    98,    -1,    -1,    -1,   102,    -1,    -1,    -1,
      -1,    99,   100,   101,    -1,    -1,   112,    -1,    -1,    -1,
      -1,    99,   100,   101,   112,    -1,    -1,    -1,    99,   100,
     101,    -1,    -1,    -1,   112,    -1,    -1,    -1,    -1,    -1,
      -1,   112
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,   112,   115,   116,     0,     4,   119,     1,     3,     5,
       6,     7,     8,     9,    17,    18,    19,    20,    23,    24,
      25,    26,    27,    37,    38,    39,    40,    41,    42,    43,
      47,    48,    49,    51,    52,    62,    63,    64,    65,    66,
      67,    68,    69,    70,    71,    72,    73,    74,    75,    76,
      77,    78,    79,    80,    81,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,    95,    96,
      97,    98,   102,   112,   117,   118,   120,   140,   151,   156,
       1,    50,   103,   121,   122,   123,   124,   125,   126,   127,
     128,   129,   113,   113,   157,   152,   119,    10,    11,    12,
      13,    14,    15,    16,    28,     3,    44,   113,   158,    51,
     102,   112,   113,   153,   112,   141,   142,   145,   148,   119,
     119,   119,   119,   119,   119,   119,     1,   130,   131,    45,
     104,   105,   106,   107,   108,   109,   110,   111,   155,    51,
     153,    53,    56,    57,   113,   113,   113,   113,   113,   113,
     113,   113,   113,   132,    46,   155,   154,   111,   112,   113,
     120,     3,    59,    59,    32,    33,    34,    35,   112,   134,
       3,   154,     3,    36,    99,   100,   101,   120,   155,     3,
      54,     3,     3,     1,    10,   133,   112,   138,     3,   154,
     113,    55,    60,   113,   113,    29,     1,   133,     3,   113,
       3,   149,     3,   112,   113,    31,   143,    61,   119,    30,
     137,   135,   119,   119,     3,   150,   113,   139,   113,   144,
     113,     3,   120,   140,   146,   137,   119,   113,   147,   136,
     113
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   114,   116,   117,   115,   118,   118,   118,   118,   118,
     119,   119,   119,   119,   119,   119,   119,   119,   121,   120,
     122,   120,   123,   120,   124,   120,   125,   120,   126,   120,
     127,   120,   128,   120,   129,   120,   120,   131,   130,   130,
     132,   132,   132,   132,   132,   133,   133,   134,   135,   136,
     134,   134,   137,   137,   138,   138,   139,   139,   139,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   140,   140,
     140,   140,   140,   140,   140,   140,   140,   140,   141,   141,
     141,   141,   143,   144,   142,   146,   147,   145,   149,   150,
     148,   151,   152,   152,   152,   152,   153,   153,   153,   154,
     154,   154,   154,   154,   154,   155,   155,   155,   155,   155,
     155,   155,   156,   157,   157,   158,   158
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     0,     0,     6,     1,     1,     1,     1,     1,
       0,     2,     2,     2,     2,     2,     2,     2,     0,     5,
       0,     5,     0,     5,     0,     5,     0,     5,     0,     5,
       0,     5,     0,     5,     0,     5,     3,     0,     4,     1,
       0,     2,     2,     2,     2,     0,     1,     6,     0,     0,
      11,     3,     0,     1,     5,     3,     0,     2,     2,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     0,     1,
       1,     1,     0,     0,     9,     0,     0,    12,     0,     0,
       8,     4,     0,     2,     4,     6,     4,     5,     6,     0,
       2,     2,     2,     2,     2,     1,     1,     1,     1,     1,
       1,     1,     4,     0,     2,     4,     1
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (ctxt, lctxt, YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value, ctxt, lctxt); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, void *ctxt, void *lctxt)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  YYUSE (ctxt);
  YYUSE (lctxt);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep, void *ctxt, void *lctxt)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep, ctxt, lctxt);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule, void *ctxt, void *lctxt)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              , ctxt, lctxt);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule, ctxt, lctxt); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep, void *ctxt, void *lctxt)
{
  YYUSE (yyvaluep);
  YYUSE (ctxt);
  YYUSE (lctxt);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void *ctxt, void *lctxt)
{
/* The lookahead symbol.  */
int yychar;


/* The semantic value of the lookahead symbol.  */
/* Default value used for initialization, for pacifying older GCCs
   or non-GCC compilers.  */
YY_INITIAL_VALUE (static YYSTYPE yyval_default;)
YYSTYPE yylval YY_INITIAL_VALUE (= yyval_default);

    /* Number of syntax errors so far.  */
    int yynerrs;

    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex (&yylval, lctxt);
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 218 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFstart(CTXT); }
#line 1907 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 3:
#line 218 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFstop(CTXT); }
#line 1913 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 5:
#line 222 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = 1; }
#line 1919 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 6:
#line 223 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = 2; }
#line 1925 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 7:
#line 224 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = 3; }
#line 1931 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 8:
#line 225 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = 4; }
#line 1937 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 9:
#line 226 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = 5; }
#line 1943 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 15:
#line 234 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFmangleText(CTXT, (yyvsp[0].text)); free((void *)(yyvsp[0].text)); }
#line 1949 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 18:
#line 239 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, NO); }
#line 1955 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 19:
#line 239 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, NO); }
#line 1961 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 20:
#line 240 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 1967 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 21:
#line 240 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 1973 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 22:
#line 241 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 1979 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 23:
#line 241 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 1985 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 24:
#line 242 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 1991 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 25:
#line 242 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 1997 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 26:
#line 243 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 2003 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 27:
#line 243 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 2009 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 28:
#line 244 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 2015 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 29:
#line 244 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 2021 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 30:
#line 245 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 2027 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 31:
#line 245 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 2033 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 32:
#line 246 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 2039 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 33:
#line 246 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 2045 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 34:
#line 247 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, NO); }
#line 2051 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 35:
#line 247 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, NO); }
#line 2057 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 37:
#line 252 "rtfGrammar.y" /* yacc.c:1646  */
    { fieldStart = GSRTFgetPosition(CTXT);}
#line 2063 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 38:
#line 252 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFaddField(CTXT, fieldStart, (yyvsp[-1].text)); free((void *)(yyvsp[-1].text)); }
#line 2069 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 47:
#line 267 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.text) = (yyvsp[-2].text);}
#line 2075 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 48:
#line 268 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 2081 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 49:
#line 268 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 2087 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 50:
#line 268 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.text) = (yyvsp[-4].text);}
#line 2093 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 51:
#line 269 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.text) = NULL;}
#line 2099 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 59:
#line 289 "rtfGrammar.y" /* yacc.c:1646  */
    { int font;
		    
						  if ((yyvsp[0].cmd).isEmpty)
						      font = 0;
						  else
						      font = (yyvsp[0].cmd).parameter;
						  GSRTFfontNumber(CTXT, font); }
#line 2111 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 60:
#line 296 "rtfGrammar.y" /* yacc.c:1646  */
    { int size;

						  if ((yyvsp[0].cmd).isEmpty)
						      size = 24;
						  else
						      size = (yyvsp[0].cmd).parameter;
						  GSRTFfontSize(CTXT, size); }
#line 2123 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 61:
#line 303 "rtfGrammar.y" /* yacc.c:1646  */
    { int width; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      width = 12240;
						  else
						      width = (yyvsp[0].cmd).parameter;
						  GSRTFpaperWidth(CTXT, width);}
#line 2135 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 62:
#line 310 "rtfGrammar.y" /* yacc.c:1646  */
    { int height; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      height = 15840;
						  else
						      height = (yyvsp[0].cmd).parameter;
						  GSRTFpaperHeight(CTXT, height);}
#line 2147 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 63:
#line 317 "rtfGrammar.y" /* yacc.c:1646  */
    { int margin; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      margin = 1800;
						  else
						      margin = (yyvsp[0].cmd).parameter;
						  GSRTFmarginLeft(CTXT, margin);}
#line 2159 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 64:
#line 324 "rtfGrammar.y" /* yacc.c:1646  */
    { int margin; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      margin = 1800;
						  else
						      margin = (yyvsp[0].cmd).parameter;
						  GSRTFmarginRight(CTXT, margin); }
#line 2171 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 65:
#line 331 "rtfGrammar.y" /* yacc.c:1646  */
    { int margin; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      margin = 1440;
						  else
						      margin = (yyvsp[0].cmd).parameter;
						  GSRTFmarginTop(CTXT, margin); }
#line 2183 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 66:
#line 338 "rtfGrammar.y" /* yacc.c:1646  */
    { int margin; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      margin = 1440;
						  else
						      margin = (yyvsp[0].cmd).parameter;
						  GSRTFmarginButtom(CTXT, margin); }
#line 2195 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 67:
#line 345 "rtfGrammar.y" /* yacc.c:1646  */
    { int indent; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      indent = 0;
						  else
						      indent = (yyvsp[0].cmd).parameter;
						  GSRTFfirstLineIndent(CTXT, indent); }
#line 2207 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 68:
#line 352 "rtfGrammar.y" /* yacc.c:1646  */
    { int indent; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      indent = 0;
						  else
						      indent = (yyvsp[0].cmd).parameter;
						  GSRTFleftIndent(CTXT, indent);}
#line 2219 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 69:
#line 359 "rtfGrammar.y" /* yacc.c:1646  */
    { int indent; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      indent = 0;
						  else
						      indent = (yyvsp[0].cmd).parameter;
						  GSRTFrightIndent(CTXT, indent);}
#line 2231 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 70:
#line 366 "rtfGrammar.y" /* yacc.c:1646  */
    { int location; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      location = 0;
						  else
						      location = (yyvsp[0].cmd).parameter;
						  GSRTFtabstop(CTXT, location);}
#line 2243 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 71:
#line 373 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFalignCenter(CTXT); }
#line 2249 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 72:
#line 374 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFalignJustified(CTXT); }
#line 2255 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 73:
#line 375 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFalignLeft(CTXT); }
#line 2261 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 74:
#line 376 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFalignRight(CTXT); }
#line 2267 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 75:
#line 377 "rtfGrammar.y" /* yacc.c:1646  */
    { int space; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      space = 0;
						  else
						      space = (yyvsp[0].cmd).parameter;
						  GSRTFspaceAbove(CTXT, space); }
#line 2279 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 76:
#line 384 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFlineSpace(CTXT, (yyvsp[0].cmd).parameter); }
#line 2285 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 77:
#line 385 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFdefaultParagraph(CTXT); }
#line 2291 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 78:
#line 386 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFstyle(CTXT, (yyvsp[0].cmd).parameter); }
#line 2297 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 79:
#line 387 "rtfGrammar.y" /* yacc.c:1646  */
    { if ((yyvsp[0].cmd).parameter)
						    {
						      GSRTFsetCodepage(CTXT, (yyvsp[0].cmd).parameter);
						    }
						}
#line 2307 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 80:
#line 392 "rtfGrammar.y" /* yacc.c:1646  */
    { int color; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      color = 0;
						  else
						      color = (yyvsp[0].cmd).parameter;
						  GSRTFcolorbg(CTXT, color); }
#line 2319 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 81:
#line 399 "rtfGrammar.y" /* yacc.c:1646  */
    { int color; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      color = 0;
						  else
						      color = (yyvsp[0].cmd).parameter;
						  GSRTFcolorfg(CTXT, color); }
#line 2331 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 82:
#line 406 "rtfGrammar.y" /* yacc.c:1646  */
    { int color; 
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      color = 0;
						  else
						      color = (yyvsp[0].cmd).parameter;
						  GSRTFunderlinecolor(CTXT, color); }
#line 2343 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 83:
#line 413 "rtfGrammar.y" /* yacc.c:1646  */
    { int script;
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      script = 6;
						  else
						      script = (yyvsp[0].cmd).parameter;
						  GSRTFsubscript(CTXT, script); }
#line 2355 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 84:
#line 420 "rtfGrammar.y" /* yacc.c:1646  */
    { int script;
		
		                                  if ((yyvsp[0].cmd).isEmpty)
						      script = 6;
						  else
						      script = (yyvsp[0].cmd).parameter;
						  GSRTFsuperscript(CTXT, script); }
#line 2367 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 85:
#line 427 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFbold(CTXT, on); }
#line 2379 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 86:
#line 434 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFitalic(CTXT, on); }
#line 2391 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 87:
#line 441 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleSingle | NSUnderlinePatternSolid); }
#line 2403 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 88:
#line 448 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleSingle | NSUnderlinePatternDot); }
#line 2415 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 89:
#line 455 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleSingle | NSUnderlinePatternDash); }
#line 2427 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 90:
#line 462 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleSingle | NSUnderlinePatternDashDot); }
#line 2439 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 91:
#line 469 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleSingle | NSUnderlinePatternDashDotDot); }
#line 2451 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 92:
#line 476 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleDouble | NSUnderlinePatternSolid); }
#line 2463 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 93:
#line 483 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunderline(CTXT, NO, NSUnderlineStyleNone); }
#line 2469 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 94:
#line 484 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleThick | NSUnderlinePatternSolid); }
#line 2481 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 95:
#line 491 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleThick | NSUnderlinePatternDot); }
#line 2493 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 96:
#line 498 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleThick | NSUnderlinePatternDash); }
#line 2505 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 97:
#line 505 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleThick | NSUnderlinePatternDashDot); }
#line 2517 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 98:
#line 512 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleThick | NSUnderlinePatternDashDotDot); }
#line 2529 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 99:
#line 519 "rtfGrammar.y" /* yacc.c:1646  */
    { BOOL on;

		                                  if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
						      on = YES;
						  else
						      on = NO;
						  GSRTFunderline(CTXT, on, NSUnderlineStyleSingle | NSUnderlinePatternSolid | NSUnderlineByWordMask); }
#line 2541 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 100:
#line 526 "rtfGrammar.y" /* yacc.c:1646  */
    {   NSInteger style;
   if ((yyvsp[0].cmd).isEmpty || (yyvsp[0].cmd).parameter)
     style = NSUnderlineStyleSingle | NSUnderlinePatternSolid;
   else
     style = NSUnderlineStyleNone;
   GSRTFstrikethrough(CTXT, style); }
#line 2552 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 101:
#line 532 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFstrikethrough(CTXT, NSUnderlineStyleDouble | NSUnderlinePatternSolid); }
#line 2558 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 102:
#line 533 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, (yyvsp[0].cmd).parameter); }
#line 2564 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 103:
#line 534 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFdefaultCharacterStyle(CTXT); }
#line 2570 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 104:
#line 535 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFparagraph(CTXT); }
#line 2576 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 105:
#line 536 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFparagraph(CTXT); }
#line 2582 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 106:
#line 537 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2022); }
#line 2588 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 107:
#line 538 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2014); }
#line 2594 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 108:
#line 539 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2023); }
#line 2600 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 109:
#line 540 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2003); }
#line 2606 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 110:
#line 541 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2002); }
#line 2612 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 111:
#line 542 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2005); }
#line 2618 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 112:
#line 543 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2018); }
#line 2624 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 113:
#line 544 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2019); }
#line 2630 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 114:
#line 545 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x201c); }
#line 2636 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 115:
#line 546 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x201d); }
#line 2642 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 116:
#line 547 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFunicode(CTXT, 0x2011); }
#line 2648 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 117:
#line 548 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFgenericRTFcommand(CTXT, (yyvsp[0].cmd)); 
		                                  free((void*)(yyvsp[0].cmd).name); }
#line 2655 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 122:
#line 567 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 2661 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 123:
#line 567 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 2667 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 124:
#line 568 "rtfGrammar.y" /* yacc.c:1646  */
    {
			GSRTFNeXTGraphic (CTXT, (yyvsp[-6].text), (yyvsp[-5].cmd).parameter, (yyvsp[-4].cmd).parameter);
		}
#line 2675 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 125:
#line 582 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 2681 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 126:
#line 582 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 2687 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 127:
#line 583 "rtfGrammar.y" /* yacc.c:1646  */
    {
			GSRTFNeXTHelpLink (CTXT, (yyvsp[-10].cmd).parameter, (yyvsp[-8].text), (yyvsp[-6].text), (yyvsp[-4].text));
		}
#line 2695 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 128:
#line 596 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFopenBlock(CTXT, YES); }
#line 2701 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 129:
#line 596 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFcloseBlock(CTXT, YES); }
#line 2707 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 130:
#line 597 "rtfGrammar.y" /* yacc.c:1646  */
    {
			GSRTFNeXTHelpMarker (CTXT, (yyvsp[-6].cmd).parameter, (yyvsp[-4].text));
		}
#line 2715 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 135:
#line 612 "rtfGrammar.y" /* yacc.c:1646  */
    { free((void *)(yyvsp[-1].text));}
#line 2721 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 136:
#line 617 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFregisterFont(CTXT, (yyvsp[0].text), (yyvsp[-2].number), (yyvsp[-3].cmd).parameter);
                                                          free((void *)(yyvsp[0].text)); }
#line 2728 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 137:
#line 620 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFregisterFont(CTXT, (yyvsp[0].text), (yyvsp[-2].number), (yyvsp[-4].cmd).parameter);
                                                          free((void *)(yyvsp[0].text)); }
#line 2735 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 138:
#line 623 "rtfGrammar.y" /* yacc.c:1646  */
    { GSRTFregisterFont(CTXT, (yyvsp[0].text), (yyvsp[-2].number), (yyvsp[-4].cmd).parameter);
                                                          free((void *)(yyvsp[0].text)); }
#line 2742 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 145:
#line 637 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = RTFfamilyNil - RTFfamilyNil; }
#line 2748 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 146:
#line 638 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = RTFfamilyRoman - RTFfamilyNil; }
#line 2754 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 147:
#line 639 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = RTFfamilySwiss - RTFfamilyNil; }
#line 2760 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 148:
#line 640 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = RTFfamilyModern - RTFfamilyNil; }
#line 2766 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 149:
#line 641 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = RTFfamilyScript - RTFfamilyNil; }
#line 2772 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 150:
#line 642 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = RTFfamilyDecor - RTFfamilyNil; }
#line 2778 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 151:
#line 643 "rtfGrammar.y" /* yacc.c:1646  */
    { (yyval.number) = RTFfamilyTech - RTFfamilyNil; }
#line 2784 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 155:
#line 660 "rtfGrammar.y" /* yacc.c:1646  */
    { 
		       GSRTFaddColor(CTXT, (yyvsp[-3].cmd).parameter, (yyvsp[-2].cmd).parameter, (yyvsp[-1].cmd).parameter);
		       free((void *)(yyvsp[0].text));
		     }
#line 2793 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;

  case 156:
#line 665 "rtfGrammar.y" /* yacc.c:1646  */
    { 
		       GSRTFaddDefaultColor(CTXT);
		       free((void *)(yyvsp[0].text));
		     }
#line 2802 "rtfGrammar.tab.m" /* yacc.c:1646  */
    break;


#line 2806 "rtfGrammar.tab.m" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (ctxt, lctxt, YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (ctxt, lctxt, yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval, ctxt, lctxt);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp, ctxt, lctxt);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (ctxt, lctxt, YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval, ctxt, lctxt);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp, ctxt, lctxt);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 677 "rtfGrammar.y" /* yacc.c:1906  */


/*	some C code here	*/

