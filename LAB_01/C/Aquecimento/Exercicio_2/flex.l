%{
  #include<stdio.h>
%}
%%
[A-Z]   { printf("%c", yytext[0] + 32); }
%%
int main() {
  yylex();
  return 0;
}

/* Definindo esta funcao nao precisa compilar com -lfl */
int yywrap() {
  return 1;
}