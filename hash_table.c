#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define NHASH 9997
#define MAX_NAME 256

struct symbol *symtab[NHASH];
struct symbol *lookup(char *);
void addref(int, char *, char *, int);
char curfilename;
// name of current input file */

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
static unsigned symhash(char *sym)
{
    // unsigned int hash = 0;
    // unsigned c;
    // while ((c = sym++))
    // {
    //     printf("sym=%c", sym);
    //     //printf("c = %i", c);
    //     hash = (hash * 9 ^ c) % NHASH;
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

int main()
{
    printf("Risad =>%i\n", symhash("Risad"));
    printf("Liza => %i\n", symhash("Liza"));
    printf("Ruksana => %i\n", symhash("Ruksana"));
    printf("Iran => %i\n", symhash("Iran"));
    printf("Sufia =>%i\n", symhash("Sufia"));
    printf("Gazi => %i\n", symhash("Gazi"));

    return 0;
}