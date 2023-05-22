%option noyywrap
%{
#include "calculator.tab.h"

#define     NUMBER 258
#define      ADD 259
#define     SUB 260
#define      MUL 261
#define      DIV 262
#define     ABS 263
#define     EOL 264
%}

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }
%%
