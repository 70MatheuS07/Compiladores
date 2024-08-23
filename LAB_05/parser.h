/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_H_INCLUDED
# define YY_YY_PARSER_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ASSIGN = 258,                  /* ASSIGN  */
    BEGIN_RW = 259,                /* BEGIN_RW  */
    BOOL = 260,                    /* BOOL  */
    ELSE = 261,                    /* ELSE  */
    END = 262,                     /* END  */
    EQ = 263,                      /* EQ  */
    FALSE = 264,                   /* FALSE  */
    ID = 265,                      /* ID  */
    IF = 266,                      /* IF  */
    INT = 267,                     /* INT  */
    INT_VAL = 268,                 /* INT_VAL  */
    LPAR = 269,                    /* LPAR  */
    LT = 270,                      /* LT  */
    MINUS = 271,                   /* MINUS  */
    OVER = 272,                    /* OVER  */
    PLUS = 273,                    /* PLUS  */
    PROGRAM = 274,                 /* PROGRAM  */
    READ = 275,                    /* READ  */
    REAL = 276,                    /* REAL  */
    REAL_VAL = 277,                /* REAL_VAL  */
    REPEAT = 278,                  /* REPEAT  */
    RPAR = 279,                    /* RPAR  */
    SEMI = 280,                    /* SEMI  */
    STRING = 281,                  /* STRING  */
    STR_VAL = 282,                 /* STR_VAL  */
    THEN = 283,                    /* THEN  */
    TIMES = 284,                   /* TIMES  */
    TRUE = 285,                    /* TRUE  */
    UNTIL = 286,                   /* UNTIL  */
    VAR = 287,                     /* VAR  */
    WRITE = 288                    /* WRITE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef Type YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_H_INCLUDED  */
