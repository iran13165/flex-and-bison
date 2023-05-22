%option noyywrap
%{
#include "cacl.tab.h"
#define NUMBER 258
#define ADD 259
#define EOL 260
%}

%%
"+" {return ADD;}
[0-9]+ {yylval = atoi(yytext); return NUMBER;}
[ \t] {;}
\n {return EOL;}
. {printf("Mistery Charecter %c", *yytext);}
%%