%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"y.tab.h"
%}
%%
begin return begin_t;
end return end_t;
while return while_t;
if return if_t;
else return else_t;
for return for_t;
get return scanf_t;
print return print_t;
int return int_t;
float return float_t;
char return char_t;
"(" return lbracklet_t;
")" return rbracklet_t;
":" return colon_t;
";" return semicolon_t;
"," return comma_t;
"." return dot_t;
"{" return lcurlyb_t;
"}" return rcurlyb_t;
"=" return equal_t;
"!=" return not_equal_t;
"&&" return and_t;
"||" return or_t;
"!" return not_t;
">" return greater_t;
"<" return less_t;
"==" return eq_equal_t;
"=>" return eq_greater_t;
"<=" return eq_less_t;
"+" return plus_t;
"-" return minus_t;
"/" return divide_t;
"*" return multi_t;
'%' return mod_t;
[ \t\n]          /* ignore whitespace */;
[a-zA-Z] return CHAR;
[+-]?[0-9]+ return INTEGER;
[a-zA-z]([a-zA-Z]|[0-9])* return VAR;
[+-]?[0-9]*(\.)[0-9]+ return FLOAT; 
              /* ignore end of line */
%%

int yywrap() {return 1;}