%output "parser.c"          // File name of generated parser.
%defines "parser.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}
%token ZERO ONE IF ELSE OTHER LPAR RPAR ENTER
%%
line: statement ENTER line | %empty ;
statement: if-stmt | OTHER ;
if-stmt: IF expr statement | IF expr statement ELSE statement ;
expr: LPAR ZERO RPAR | LPAR ONE RPAR ;
%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
