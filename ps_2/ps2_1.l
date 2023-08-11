digit [0-9]
alpha [A-Za-z]
space [ ]
line \n
special [^a-zA-Z0-9]
%{
    int digitCount;
    int alphaCount;
    int spaceCount;
    int lineCount;
    int specialCount;
    int wordCount;
%}
%%
    /* match identifier */
{alpha} alphaCount++;
{digit} digitCount++;
{space} spaceCount++;
{line} lineCount++;
{special} specialCount++;
" "?({alpha}|{digit})+" "? {
    wordCount++;
} 
" "?({alpha}|{digit})+\n {
    wordCount++;
} 
" "?({alpha}|{digit})+$ wordCount++;
%%
int main(void) {
    yylex();
    printf("number of digits = %d\n", digitCount);
    printf("number of alpha = %d\n", alphaCount);
    printf("number of space = %d\n", spaceCount);
    printf("number of line = %d\n", lineCount);
    printf("number of speial chars = %d\n", specialCount);
    printf("number of words = %d\n", wordCount);
    return 0;
}
