%{
#include <stdio.h>
#include <stdlib.h>

int COMMENT = 0;
int cnt = 0;
%}

identifier [a-zA-Z][a-zA-Z0-9]*
%%
"/*"                        { COMMENT = 1; }
"*/"                        { COMMENT = 0; cnt++; }
{identifier}\(              { if (!COMMENT) printf("\n\nFUNCTION\n\t%s", yytext); }
\{                          { if (!COMMENT) printf("\n BLOCK BEGINS"); }
\}                          { if (!COMMENT) printf("\n BLOCK ENDS"); }
{identifier}(\[[0-9]*\])?   { if (!COMMENT) printf("\n %s IDENTIFIER", yytext); }
\"[^\"]*\"                  { if (!COMMENT) printf("\n\t%s is a STRING", yytext); }
[0-9]+                      { if (!COMMENT) printf("\n\t%s is a NUMBER", yytext); }
\)                          { if (!COMMENT) printf("\n\t"); ECHO; printf("\n"); }
\;                          { if (!COMMENT) printf("\n\t%s is a SEMICOLON", yytext); }
=                           { if (!COMMENT) printf("\n\t%s is an ASSIGNMENT OPERATOR", yytext); }
\<=|\>=|\<|\>|\==          { if (!COMMENT) printf("\n\t%s is a RELATIONAL OPERATOR", yytext); }
[ \t\n]+                    { /* Ignore whitespace */ }
.                           { if (!COMMENT) printf("\nUNKNOWN: %s", yytext); }
%%

int main(int argc, char **argv)
{
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            printf("Could not open %s\n", argv[1]);
            exit(1);
        }
        yyin = file;
    }
    yylex();
    printf("\n\nTotal No. of comments are %d\n", cnt);
    return 0;
}

int yywrap()
{
    return 1;
}

