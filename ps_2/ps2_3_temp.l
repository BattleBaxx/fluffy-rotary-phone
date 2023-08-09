%%

    /* Single line comment */
"//".* { /* Do nothing */ }

    /* Multi line comment */
"/*" {
    while (1) {
        printf("test: %c\n", yytext[0]);
        if (yytext[0] == '*' && yytext[1] == '/') {
            break;
        }
        yytext++;
    }
}

    /* Any other character */
. {
    /* Print the character */
    printf("%c", yytext[0]);
}

%%

int main() {
    /* Open the input file */
    FILE *fp = fopen("input.cpp", "r");

    /* Initialize the lexer */
    yylex();

    /* Close the input file */
    fclose(fp);

    return 0;
}