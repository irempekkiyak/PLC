%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h> 
int yylex(void);       
int yyerror(char *s){ printf("syntax error\n"); return 0;}
%}

%name parse
%token begin_t end_t VAR digit while_t if_t else_t for_t INTEGER FLOAT CHAR
%token scanf_t print_t int_t float_t char_t lbracklet_t rbracklet_t 
%token colon_t semicolon_t comma_t dot_t lcurlyb_t rcurlyb_t
%token equal_t not_equal_t and_t or_t not_t greater_t less_t 
%token eq_greater_t eq_less_t plus_t minus_t divide_t multi_t mod_t eq_equal_t


%%
START: begin_t end_t {printf("OK\n"); return 0;} 
        | begin_t STMTS end_t {printf("OK\n"); return 0;};
STMTS: STMTS STMT
        | STMT
        ;
STMT: IF_STMT
        | WHILE_STMT
        | FOR_STMT
        | VAR_DEC
        | ARITHMETIC_OPR
        | VAR
        | ASSIGNMENT_OPR
        | PRINTING
        | SCANF
        ;
IF_STMT: if_t COMPARISON_EXPR lbracklet_t STMTS rbracklet_t
        | if_t COMPARISON_EXPR lbracklet_t STMTS rbracklet_t ELSE_STMT 
        ;
ELSE_STMT: else_t lbracklet_t STMTS rbracklet_t
        ;
WHILE_STMT: while_t COMPARISON_EXPR lbracklet_t STMTS rbracklet_t 
        ;
FOR_STMT: for_t ASSIGNMENT_OPR comma_t COMPARISON_EXPR lbracklet_t STMTS rbracklet_t
        ;
COMPARISON_EXPR: LHS EQUALITY EXPRESSIONS 
        | LHS EQUALITY EXPRESSIONS LOGICAL_OPR LHS EQUALITY EXPRESSIONS
        | ASSIGNMENT_OPR EQUALITY EXPRESSIONS
        | ASSIGNMENT_OPR EQUALITY EXPRESSIONS LOGICAL_OPR LHS EQUALITY EXPRESSIONS
        | ASSIGNMENT_OPR EQUALITY EXPRESSIONS LOGICAL_OPR ASSIGNMENT_OPR EQUALITY EXPRESSIONS
        | ASSIGNMENT_OPR EQUALITY ASSIGNMENT_OPR
        | EXPRESSIONS LOGICAL_OPR EXPRESSIONS
        | ASSIGNMENT_OPR LOGICAL_OPR ASSIGNMENT_OPR
        ;
LOGICAL_OPR: and_t
        | or_t
        | not_t
        ;
EQUALITY: eq_equal_t
        | less_t
        | greater_t
        | eq_less_t
        | eq_greater_t
        | not_equal_t
        ;
EXPRESSIONS: VAR
        | INTEGER
        | FLOAT
        ;
ASSIGNMENT_OPR: LHS equal_t RHS
        ;
VAR_DEC: TYPE_DEC colon_t VAR
        ;
LHS:    VAR
        | VAR_DEC
        ;
RHS: EXPRESSIONS
        | ARITHMETIC_OPR
        ;
ARITHMETIC_OPR: EXPRESSIONS MATH_OPERATORS EXPRESSIONS 
        | lbracklet_t EXPRESSIONS MATH_OPERATORS EXPRESSIONS rbracklet_t
        | EXPRESSIONS MATH_OPERATORS lbracklet_t EXPRESSIONS MATH_OPERATORS EXPRESSIONS rbracklet_t 
        | lbracklet_t EXPRESSIONS MATH_OPERATORS EXPRESSIONS rbracklet_t MATH_OPERATORS EXPRESSIONS   
       ;
MATH_OPERATORS: plus_t
        | minus_t
        | divide_t
        | mod_t
        | multi_t
        ;
SCANF: scanf_t less_t VAR greater_t
        ;
PRINTING: print_t LHS
        | print_t ASSIGNMENT_OPR
        ;

TYPE_DEC: int_t
        | float_t
        | char_t
        ;
%%

#include "lex.yy.c"
int main()
{
    return yyparse();
}
