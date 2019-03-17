%{

#include <stdio.h>
#include <string.h>
int email =0;
int unicamp=0;
int fee=0;
%}
LETRA [a-zA-Z]
DIGITO [0-9]
ALFANUM [a-zA-Z0-9]

EMAIL {ALFANUM}+[@]({ALFANUM}+[.]?)+
UNICAMP {ALFANUM}+[@]({ALFANUM}+[.])*(unicamp[.]br)
FEE {ALFANUM}+[@]({ALFANUM}+[.])*(fee[.]unicamp[.]br)
%%
{FEE} {
    email++;
    unicamp++;
    fee++;
}
{UNICAMP} {
    email++;
    unicamp++;
}
{EMAIL} {
    email++;
}

[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;

%%

int main() {
  yylex();
  printf("%d %d %d\n", email, unicamp, fee);
  return 0;
}
