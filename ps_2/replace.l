%{
#include<stdio.h>
#include<string.h>
  
char replace_with [] = "phail";
char replace [] ="line";
  
  
%}

%%
[a-zA-Z]+    { if(strcmp(yytext, replace)==0)
                   printf("%s", replace_with);
                else
                    printf("%s", yytext);}
.            printf("%s", yytext);
%%
  
  
int yywrap()
{
    return 1;
}
  
/* code section */
int main()
{    
        yylex();
}