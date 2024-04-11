%output "parser.c"          // File name of generated parser.
%defines "parser.h"         // Produces a 'parser.h'
%define parse.error verbose // Give proper messages when a syntax error is found.
%define parse.lac full      // Enable LAC to improve syntax error handling.

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
int soma = 0;
%}
%token NUMBER MULTI DIV PLUS MINUS ENTER LPAR RPAR
%%
line: expr ENTER line | %empty ;

expr:
  expr op expr 
| LPAR expr RPAR
| NUMBER { soma += $1; }
;

op: MULTI | DIV | PLUS | MINUS ;
%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL! Result = %d\n", soma);
    else                printf("PARSE FAILED!\n");
    return 0;
}

