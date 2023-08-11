%{
    int yylineno;
%}
%%
^(.)* printf("%d\t\t%s",yylineno++, yytext);
^\n printf("%d\t\t%s",yylineno++, yytext);
%%
int main(int argc, char *argv[]) {
    // yyin = fopen(argv[1], "r");
    yylex();
    // fclose(yyin);
}