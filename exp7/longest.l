%{
#include<stdio.h>
#include<string.h>
char longest_string[30];
int longest=0;
%}

%%

[A-Z a-z]+ { if(yyleng >longest){
longest=yyleng;
strcpy(longest_string,yytext);
}
}

%%

int main(){
yylex();
printf("The longest string %s\n",longest_string);
printf("The length string %d\n",longest);
}
int yywrap(void){
return 1;
}

