%{
    int yylineno;
%}
%%
^(.)*$ printf("%4d\t%s", ++yylineno, yytext);
[a-zA-z0-9] printf("%4d\t%s", ++yylineno, yytext);

%%
int main(int argc, char *argv[]) {
    // yyin = fopen(argv[1], "r");
    yylex();
    // fclose(yyin);
}