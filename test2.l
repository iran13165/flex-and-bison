%x incl

%{
    #define MAX_INCLUDE_DEPTH 10
    YY_BUFFER_STATE include_stack[MAX_INCLUDE_DEPTH];
    int include_stack_ptr = 0;
%}

%%
include             BEGIN(incl);

[a-z]+              ECHO;
[^a-z\n]*\n?        ECHO;

<incl>[ \t]*      /* eat the whitespace */
<incl>[^ \t\n]+   { /* got the include file name */
                if ( include_stack_ptr >= MAX_INCLUDE_DEPTH )
                {
                fprintf( stderr, "Includes nested too deeply" );
                exit( 1 );
                }

            include_stack[include_stack_ptr++] = YY_CURRENT_BUFFER;

            yyin = fopen( yytext, "r" );

            if ( ! yyin )
                return 0;

            yy_switch_to_buffer(
                yy_create_buffer( yyin, YY_BUF_SIZE ) );

            BEGIN(INITIAL);
            }

           <<EOF>> {
            if ( --include_stack_ptr)
                {
                yyterminate();
                }

            else
                {
                yy_delete_buffer( YY_CURRENT_BUFFER );
                yy_switch_to_buffer(
                     include_stack[include_stack_ptr] );
                }
            }
%%
int yywrap(){}
int main(){
    yylex();
    return 0;
}