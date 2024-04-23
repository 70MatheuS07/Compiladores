%option outfile="scanner.c"
%option noyywrap
%option nounput
%option noinput

%{
#include "parser.h"
int lines = 1;
%}

digito  [0-9]
naozero [1-9]
num     ({naozero}{digito}*)|0
float   ({num}\.{num})

letra       [A-Za-z]
id          {letra}*
string      \"[^""]*\"
comentario  \{[^{}]*\}

%%

\n                  { lines++; }
{comentario}        { 
                        int i;
                        for (i = 0; i < yyleng; i++) {
                            if (yytext[i] == '\n') {
                                lines++;
                            }
                        }
                    }

"begin"         { return BE_GIN; }
"bool"          { return BOOL; }
"else"          { return ELSE; }
"end"           { return END; }
"false"         { return FALSE; }
"if"            { return IF; }
"int"           { return INT; }
"program"       { return PROGRAM; }
"read"          { return READ; }
"real"          { return REAL; }
"repeat"        { return REPEAT; }
"string"        { return STRING; }
"then"          { return THEN; }
"true"          { return TRUE; }
"until"         { return UNTIL; }
"var"           { return VAR; }
"write"         { return WRITE; }


":="        { return ASSIGN; }
"="         { return EQ; }
"<"         { return LT; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return OVER; }
"("         { return LPAR; }
")"         { return RPAR; }
";"         { return SEMI; }

{num}       { return INT_VAL; }
{float}     { return REAL_VAL; }
{string}    { return STR_VAL; }
{id}        { return ID; }
" "         {  }

.       { printf("LEXICAL ERROR (%d): Unknown symbol %s\n", lines, yytext); exit(1); }

