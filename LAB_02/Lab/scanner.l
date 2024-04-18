%option outfile="scanner.c"
%option noyywrap
%option nounput
%option noinput

%{
#include <string.h>
#include "parser.h"
int lines = 1;
char *TransformaPalavra(char *palavra);
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

"begin"|"bool"|"else"|"end"|"false"|"if"|"int"|"program"|"read"|"real"|"repeat"|"string"|"then"|"true"|"until"|"var"|"write" {   
                        char *transformada = TransformaPalavra(yytext);
                        printf("%d: %s -> %s\n", lines, yytext, transformada);
                        free(transformada);
                    }

":="        { printf("%d: %s -> ASSIGN\n", lines, yytext); }

"="         { printf("%d: %s -> EQ\n", lines, yytext); }

"<"         { printf("%d: %s -> LT\n", lines, yytext); }

"+"         { printf("%d: %s -> PLUS\n", lines, yytext); }

"-"         { printf("%d: %s -> MINUS\n", lines, yytext); }

"*"         { printf("%d: %s -> TIMES\n", lines, yytext); }

"/"         { printf("%d: %s -> OVER\n", lines, yytext); }

"("         { printf("%d: %s -> LPAR\n", lines, yytext); }

")"         { printf("%d: %s -> RPAR\n", lines, yytext); }

";"         { printf("%d: %s -> SEMI\n", lines, yytext); }

{num}       { printf("%d: %s -> INT_VAL\n", lines, yytext); }

{float}     { printf("%d: %s -> REAL_VAL\n", lines, yytext); }

{string}    { printf("%d: %s -> STR_VAL\n", lines, yytext); }

{id}        { printf("%d: %s -> ID\n", lines, yytext); }

"_"           { printf("LEXICAL ERROR (%d): Unknown symbol _", lines); exit(1); }

","           { printf("LEXICAL ERROR (%d): Unknown symbol ,", lines); exit(1); }

"#"           { printf("LEXICAL ERROR (%d): Unknown symbol #", lines); exit(1); }

.|" "          {  }
%%

int main() {
    yylex();
    return 0;
}

char* TransformaPalavra(char *palavra) {
    int i;
    int tamanho = strlen(palavra);
    char *result = (char*) malloc((tamanho + 1) * sizeof(char));

    for (i = 0; i < tamanho; i++) {
        // Verifica se o caractere atual é minúsculo
        if (palavra[i] >= 'a' && palavra[i] <= 'z') {
            // Transforma o caractere em maiúscula
            result[i] = palavra[i] - 32;
        } else {
            result[i] = palavra[i]; // Caso contrário, mantém o caractere como está
        }
    }

    result[tamanho] = '\0';
    return result;
}
