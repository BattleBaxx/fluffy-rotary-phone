ip_num (([0-9])|([1-9][0-9])|(1[0-9][0-9])|(2[0-4][0-9])|25[0-5])
mac_part [0-9A-Fa-f][0-9A-Fa-f]
%{
    FILE* yyin;
    FILE* yyout_valid;
    FILE* yyout_invalid;
%}
%%
^{ip_num}\.{ip_num}\.{ip_num}\.{ip_num}$ fprintf(yyout_valid, "%s\n", yytext);
^{mac_part}:{mac_part}:{mac_part}:{mac_part}:{mac_part}:{mac_part}$ fprintf(yyout_valid, "%s\n", yytext);
.|\n fprintf(yyout_invalid, "%s", yytext);
%%
int main(int argc, char* argv[]){
    yyin = fopen(argv[1], "r");
    yyout_valid = fopen(argv[2], "w");
    yyout_invalid = fopen(argv[3], "w");

    yylex();

    fclose(yyin);
    fclose(yyout_valid);
    fclose(yyout_invalid);
}