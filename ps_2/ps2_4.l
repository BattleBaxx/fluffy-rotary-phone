space [ ]+
newline \n+
tab \t+
%%
{space} printf(" ");
{newline} printf("\n");
{tab} printf("\t");
. printf("%s", yytext);

%%
int main(void){
    yylex();
}