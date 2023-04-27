%option noyywrap nodefault yylineno case-insensitive
%{

struct symbol {
    char* name;
    struct ref* reflist;
};

struct ref {
    struct ref* next;
    char* filename;
    int flags;
    int lineno;
};

#define NHASH 9997
#define MAX_NAME 256
struct symbol symtab[NHASH];
struct symbol* lookup(char*);
void addref(int, char*, char*,int);
static int symcompare(const void*, const void*);
static unsigned symhash(char*);
void printrefs();
char* curfilename;
%}

%%
a |
an |
and |
are |
as |
at |
be |
but |
for |
in |
is |
it |
of |
on |
or |
that |
the |
this  {;}
[a-z]+(\'(s|t))?  { 
    addref(yylineno, curfilename, yytext, 0); 
    }
.|\n    {;}
%%
int main(int argc,char** argv)
{
        int i;
        if(argc < 2) {
            curfilename = "(stdin)";
            yylineno = 1;
            yylex();
        } else
        for(i = 1; i < argc; i++) {
        FILE* f = fopen(argv[i], "r");
            if(!f) {
                perror(argv[1]);
                return (1);
            }
        curfilename = argv[i];
        yyrestart(f);
        yylineno = 1;
        yylex();
        fclose(f);
/* for addref */
}
 //printrefs();
}
void addref(int lineno, char *filename, char* word, int flags)
{
    printf("lineno=%i, filename=%s, word=%s, flag=%i",lineno, filename, word, flags);
    struct ref* r;
    struct symbol* sp = lookup(word);
    // /* don't do dups of same line and file */
    // if(sp->reflist &&
    // sp->reflist->lineno == lineno &&
    // sp->reflist->filename == filename) return;
    // r = malloc(sizeof(struct ref));
    // if(!r) {fputs("out of space\n", stderr); abort(); }
    // r->next = sp->reflist;
    // r->filename = filename;
    // r->lineno = lineno;
    // r->flags = flags;
    // sp->reflist = r;
}
void printrefs()
{
    struct symbol* sp;
    qsort(symtab, NHASH, sizeof(struct symbol), symcompare); 
    /* sort
    the symbol table */
    for(sp = symtab; sp->name && sp < symtab+NHASH; sp++) {
    char* prevfn = NULL;
    /* last printed filename, to skip
    dups
    reverse the list of references */
    struct ref* rp = sp->reflist;
    struct ref* rpp = 0;
    /* previous ref */
    struct ref* rpn;
    /* next ref*/
        do {
        rpn = rp->next;
        rp->next = rpp;
        rpp = rp;rp = rpn;
    } while(rp);
    /*now print the word and its references */
    printf("%10s", sp->name);
    for(rp = rpp; rp; rp = rp->next) {
        if(rp->filename == prevfn) {
            printf(" %d", rp->lineno);
        } else {
            printf(" %s:%d", rp->filename, rp->lineno);
            prevfn = rp->filename;
        }
    }
        printf("\n");
    }
}
static int symcompare(const void* xa, const void* xb)
{
    const struct symbol* a = xa;
    const struct symbol* b = xb;
    if(!a->name) {
        if(!b->name) return 0;
            // both empty
            return 1;
            //put empties at the end /
        }
    if(!b->name) return -1;
    return strcmp(a->name, b->name);
}
struct symbol* lookup(char* sym)
{
    printf("symhash = %i", symhash(sym));
    struct symbol* sp = &symtab[symhash(sym)];
    int scount = NHASH;
    while(--scount >= 0) {
        if(sp->name && !strcmp(sp->name, sym)) return sp;
        if(!sp->name) {
            sp->name = strdup(sym);
            sp->reflist = 0;
        }
        if(++sp >= symtab+NHASH) sp = symtab; 
    }
    fputs("symbol table overflow", stderr);
    abort(); //tried them all, table is full */
}
static unsigned symhash(char* sym)
{
    // unsigned int hash = 0;
    // unsigned c;
    // while(c = sym++) {
    //     hash = hash*9 ^ c;
    // }
    // return hash;
        int length = strnlen(sym, MAX_NAME);
    unsigned int hash_value =0;
    for (int i = 0; i < length; i++)
    {
        hash_value += sym[i];
        hash_value = hash_value * sym[i]%NHASH;
    }
    
    return hash_value;
}