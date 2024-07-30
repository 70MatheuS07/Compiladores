%output "parser.c"
%defines "parser.h"
%define parse.error verbose
%define parse.lac full

%{
#include <stdio.h>
#include "tables.h"

StrTable *st;
int yylex(void);
void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}
%}

%token PROGRAM ID SEMI VAR BOOL INT REAL STRING
%token BE_GIN END IF THEN ELSE REPEAT UNTIL ASSIGN READ WRITE LT EQ PLUS MINUS TIMES OVER LPAR RPAR TRUE FALSE INT_VAL REAL_VAL STR_VAL

%left PLUS MINUS
%left TIMES OVER
%nonassoc LT EQ
%right ASSIGN

%%

program:
    PROGRAM ID SEMI vars_sect stmt_sect
    ;

vars_sect:
    VAR opt_var_decl
    ;

opt_var_decl:
    %empty
    | var_decl_list
    ;

var_decl_list:
    var_decl_list var_decl
    | var_decl
    ;

var_decl:
    type_spec ID SEMI
    ;

type_spec:
    BOOL
    | INT
    | REAL
    | STRING
    ;

stmt_sect:
    BE_GIN stmt_list END
    ;

stmt_list:
    stmt_list stmt
    | stmt
    ;

stmt:
    if_stmt
    | repeat_stmt
    | assign_stmt
    | read_stmt
    | write_stmt
    ;

if_stmt:
    IF expr THEN stmt_list END
    | IF expr THEN stmt_list ELSE stmt_list END
    ;

repeat_stmt:
    REPEAT stmt_list UNTIL expr
    ;

assign_stmt:
    ID ASSIGN expr SEMI
    ;

read_stmt:
    READ ID SEMI
    ;

write_stmt:
    WRITE expr SEMI
    ;

expr:
    expr LT expr
    | expr EQ expr
    | expr PLUS expr
    | expr MINUS expr
    | expr TIMES expr
    | expr OVER expr
    | LPAR expr RPAR
    | TRUE
    | FALSE
    | INT_VAL
    | REAL_VAL
    | STR_VAL
    | ID
    ;

%%

int main(void) {
    st = create_str_table();

    if (yyparse() == 0) {
        printf("PARSE SUCCESSFUL!\n");
    } else {
        printf("PARSE FAILED!\n");
    }

    free_str_table(st);

    return 0;
}