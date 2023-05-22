%{
#include<stdio.h>
void yyerror(char*);
int yylex();
extern int yylval;
%}
%name parse
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP

%%
calclist: 
 | calclist exp EOL { printf("= %d\n", $2); 
                      printf("Risad Choudhury good boy\n");
                    }
 ;

exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: term
     | factor MUL term { $$ = $1 * $3; }
     | factor DIV term { $$ = $1 / $3; }
     ;

term: NUMBER
   | ABS term   { $$ = $2 >= 0? $2 : - $2; }
   | OP exp CP  {$$ = $2;}
   ;
%%
int main(int argc, char **argv)
{
  yyparse();
  return 0;
}

void yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}