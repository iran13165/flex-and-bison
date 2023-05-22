%{
    #include<stdio.h>
    
    void yyerror(char*);
    extern int yylex();

%}
%name parse
%token NUMBER
%token ADD
%token EOL

%%
calclist: 
   | calclist exp EOL {printf("%d\n",$2);}
   ;
exp: term
    | exp ADD term {$$ = $1 + $3;}
    ;
term: NUMBER {$$ = $1;}

%%
int main(){
    return yyparse();
    
}
void yyerror(char* s){
    printf("error %c", *s);
}