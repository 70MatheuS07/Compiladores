%option outfile="scanner.c"
%option noyywrap
%option nounput
%option noinput

%{
#include "parser.h" // For the token types from bison.
%}

%%

[0-9]+  { return NUMBER; }
"*"     { return MULTI; }
"/"     { return DIV; }
"+"     { return PLUS; }
"-"     { return MINUS; }
"("     { return LPAR; }
")"     { return RPAR; }
"\n"    { return ENTER; }
" "     { /* ignore spaces */ }
.       { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext);
          exit(EXIT_FAILURE); }
