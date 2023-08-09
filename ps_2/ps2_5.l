digit [0-9]
letter [a-zA-Z]
operator "+"|"-"|"*"|"/"|"%"|"++"|"--"|"=="|"!="|"<"|"<="|">"|">="|"&&"|"||"|"!"
%%
"auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while" printf("Keyword: %s\n\n", yytext);
{letter}({digit}|{letter})* printf("Identifier: %s\n\n", yytext);
\"(.*)\" printf("String Constant: %s\n\n", yytext);
[+-]?{digit}+"."{digit}+ printf("Floating point constant: %s\n\n", yytext);
0{digit}+ printf("Octal Number: %s\n\n", yytext);
[+-]?{digit}* printf("Integer Constant: %s\n\n", yytext);
{operator} printf("Operator: %s\n\n", yytext);
({letter}|"_")+: {
    int size = strlen(yytext); //Total size of string
    yytext[size-1] = '\0';
    printf("Label: %s\n\n", yytext);
}
. ;
%%
int main(void){
    yylex();
}