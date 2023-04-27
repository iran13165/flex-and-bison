%x inc
%{
    
%}
%%
<inc>[^ \t\n]+       {
                    
                    // int c;
                    // while((c = input()) && c != '\n')
                    // {
                    // printf("input: %d",input());
                    // }
                    yyin = fopen(yytext, "r");
                    if(!yyin){
                        return 0;
                    }
                    
                    yypush_buffer_state(yy_create_buffer( yyin, YY_BUF_SIZE ));
                    BEGIN(INITIAL);
                    //yyin = f;
                    // bs = yy_create_buffer(f, YY_BUF_SIZE);
                    // yy_switch_to_buffer(bs);
                    // yy_delete_buffer(bs);
                    // yylex();
                    
                    // printf("\nconditional input = %s\n", yytext);
                    }
                    <<EOF>> {
                       yypop_buffer_state();

                          if ( !YY_CURRENT_BUFFER )
                           {
                             yyterminate();
                            }
                    }
i      BEGIN(inc);
%%
int yywrap(){}
int main(int argc, char **argv){
    yylex();
    return 0;
}