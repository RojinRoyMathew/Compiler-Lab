%{
#include<stdio.h>
#include<math.h>
float sum=0,avg=0;
int i=0,n;
%}

%%
[0-9]+ { printf("Number is %s\n",yytext); 
         n=atoi(yytext); 
         //printf("%d",n+1);
         while(i<=n){
         sum=sum+i;
         i++;
         }
         printf("sum is %f\n",sum);
         printf("avg is %f\n",sum/n);
         }
.|\n { }

%%
int main(){
printf("Enter the number");
yylex();
return 0;
}
int yywrap(void){
return 1; 
}
