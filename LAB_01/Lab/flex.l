%{
#include <stdio.h>
#include <stdlib.h>
int lines = 1;
char *TransformaPalavra(char *palavra);
%}



%%
\n                  {lines++;}

"begin"|"bool"|"else"|"end"|"false"|"if"|"int"|"program"|"read"|"real"|"repeat"|"string"|"then"|"true"|"until"|"var"|"write"       {   
                        char *transformada = TransformaPalavra(yytext);
                        printf("%d: %s -> %s\n", lines, yytext, transformada);
                        free(transformada);
                    }

":="    { printf("%d: %s -> ASSIGN\n", lines, yytext); }

"="     { printf("%d: %s -> EQ\n", lines, yytext); }

"<"     { printf("%d: %s -> LT\n", lines, yytext); }

"+"     { printf("%d: %s -> PLUS\n", lines, yytext); }

"-"     { printf("%d: %s -> MINUS\n", lines, yytext); }

"*"     { printf("%d: %s -> TIMES\n", lines, yytext); }

"/"     { printf("%d: %s -> OVER\n", lines, yytext); }

"("     { printf("%d: %s -> LPAR\n", lines, yytext); }

")"     { printf("%d: %s -> RPAR\n", lines, yytext); }

";"     { printf("%d: %s -> SEMI\n", lines, yytext); }

.|\n      { /* Ignorar outros caracteres */ }
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
        }
    }

    result[tamanho] = '\0';
    return result;
}