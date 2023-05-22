#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define NHASH 9997
#define MAX_NAME 256
struct symbol
{
    char *name;
    struct ref *reflist;
};

struct ref
{
    struct ref *next;
    char *filename;
    int flags;
    int lineno;
};
void addref(int, char *, char *, int);
void initializeHashTable();
static unsigned symhash(char *);
struct symbol symtab[NHASH];
struct symbol *lookup(char *);
void printrefs();

int main()
{
    initializeHashTable();
    // printf("%u\n", symhash("fuck hhhhhb bbbbbbbb hhhhhhhhhhhh"));
    // printf("%u\n", symhash("luck"));
    // printf("%u\n", symhash("iran"));
    // printf("%u\n", symhash("inar"));
    // printf("%u\n", symhash("ruks"));
    // printf("%u\n", symhash("moks"));
    // printf("%u\n", symhash("sulta"));
    printf("%u\n", symhash("word"));
    addref(1, "filename", "word", 1);
    addref(1, "filename2", "word", 1);
    addref(1, "filename3", "word", 1);
    addref(1, "filename", "word3", 1);
    addref(1, "filename", "word4", 1);
    addref(1, "filename", "word5", 1);
    addref(1, "filename", "wordbb", 1);
    addref(1, "filename", "wordnh", 1);
    printrefs();
    return 0;
}
static int symcompare(const void *xa, const void *xb)
{
    const struct symbol *a = (struct symbol *)xa;
    const struct symbol *b = (struct symbol *)xb;
    // if(!a->name) { 
    //     if(!b->name) return 0;
    //         // both empty
    //         return 1;
    //         //put empties at the end /
    //     }
    // if(!b->name) return -1;
    // return strcmp(a->name, b->name);
    if (!a->name)
    {
        if (!b->name)
            return 0; /* both empty */
        return 1;     /* put empties at the end */
    }
    if (!b->name) return -1;
    return strcmp(a->name, b->name);
}
void printrefs()
{
    struct symbol *sp;
    qsort(symtab, NHASH, sizeof(struct symbol), symcompare);
    /* sort
    the symbol table */
    for (sp = symtab; sp->name && sp < symtab + NHASH; sp++)
    {
        char *prevfn = NULL;
        /* last printed filename, to skip
        dups
        reverse the list of references */
        struct ref *rp = sp->reflist;
        struct ref *rpp = 0;
        /* previous ref */
        struct ref *rpn;
        /* next ref*/
        do
        {
            rpn = rp->next;
            rp->next = rpp;
            rpp = rp;
            rp = rpn;
        } while (rp);
        /*now print the word and its references */
        printf("%10s", sp->name);
        for (rp = rpp; rp; rp = rp->next)
        {
            if (rp->filename == prevfn)
            {
                printf(" %d", rp->lineno);
            }
            else
            {
                printf(" %s:%d", rp->filename, rp->lineno);
                prevfn = rp->filename;
            }
        }
        printf("\n");
    }
}
void initializeHashTable()
{
    for (int i = 0; i < NHASH; i++)
    {
       // symtab[i] = NULL;
    }
}
static unsigned symhash(char *sym)
{
    unsigned int hash = 0;
    unsigned c;
    while (c = *sym++)
        hash = (hash * 9 ^ c) % NHASH;
    return hash;
}
void addref(int lineno, char *filename, char *word, int flags)
{
    // printf("lineno=%d, filename=%s, word=%s, flag=%d",lineno, filename, word, flags);
    // printf("invoking");
    struct ref *r;
    struct symbol *sp = lookup(word);
    // /* don't do dups of same line and file */

    if (sp->reflist &&
        sp->reflist->lineno == lineno &&
        sp->reflist->filename == filename)
        return;

    r = malloc(sizeof(struct ref));
    if (!r)
    {
        fputs("out of space\n", stderr);
        abort();
    }
    r->next = sp->reflist;
    r->filename = filename;
    r->lineno = lineno;
    r->flags = flags;
    sp->reflist = r;
}
struct symbol *lookup(char *sym)
{
    // printf("symhash = %u", symhash(sym));
    struct symbol *sp = &symtab[symhash(sym)];
    int scount = NHASH;
    // if(!sp) return;
    while (--scount >= 0)
    {
        if (sp->name && !strcasecmp(sp->name, sym))
            return sp;
        if (!sp->name)
        {
            sp->name = strdup(sym);
            sp->reflist = 0;
            return sp;
        }
        if (++sp >= symtab + NHASH)
            sp = symtab;
    }
    fputs("symbol table overflow", stderr);
    abort(); // tried them all, table is full */
}