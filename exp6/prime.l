%{
#include<stdio.h>
#include<math.h>
int i,n,flag=0;
%}

%%
[0-9]+ { printf("Number is %s\n",yytext); 
         n=atoi(yytext); 
         //printf("%d",n+1);
         for(i=2;i<(n/2);i++){
         if(n%i==0){
           flag=1;
           break;
         }}
         if(flag==1){
         printf("Not prime no\n");
         }else{
         printf("prime no\n");
         }
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
