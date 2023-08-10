alpha [A-Za-z]
num [0-9]
%{
    FILE* yyin;
    FILE* yyout_valid;
    FILE* yyout_invalid;
%}
%%
"http"s?:\/\/({alpha}|{num}|-)*".com" fprintf(yyout_valid, "%s\n", yytext);
. fprintf(yyout_invalid, "%s", yytext);
%%
int main(int argc, char* argv[]){
    yyin = fopen(argv[1], "r");
    yyout_valid = fopen(argv[2], "w");
    yyout_invalid = fopen(argv[3], "w");

    yylex();
}