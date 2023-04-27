#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#define MAX_NAME 256
#define TABE_SIZE 10

typedef struct
{
    char name[MAX_NAME];
    int age;
} Person;
Person *hash_table[TABE_SIZE];
unsigned int hash(char *name)
{
    int length = strnlen(name, MAX_NAME);
    unsigned int hash_value =0;
    for (int i = 0; i < length; i++)
    {
        hash_value += name[i];
        hash_value = hash_value * name[i]%TABE_SIZE;
    }
    
    return hash_value;
}
void init_hash_table(){
    for (int i = 0; i < TABE_SIZE; i++)
    {
        hash_table[i]=NULL;
    }
    
}
void print_table(){
    printf("start..........\n");
    for (int i = 0; i < TABE_SIZE; i++)
    {
        if(hash_table[i] == NULL){
            printf("\t%i\t-----------\n",i);
        } else{
            printf("\t%i\t%s\n",i, hash_table[i]->name);
        }
    }
    printf("end...........\n");
}
bool hash_table_insert(Person *p){
    if(p==NULL) return false;
    int index = hash(p->name);
    if(hash_table[index] != NULL){
        return NULL;
    }
    hash_table[index] = p;
    return true;

}
Person *hash_table_lookup(char* name){
    int index = hash(name);
    if(hash_table[index] != NULL && strncmp(hash_table[index]->name, name, TABE_SIZE)==0){
        return hash_table[index];
    }
    else{
        return NULL;
    }
}
Person *hash_table_delete(char *name){
    int index = hash(name);
    if(hash_table[index] != NULL){
        return NULL;
    }
    hash_table[index] = p;
    return true;
}
int main(int argc, char *argv[])
{
    init_hash_table();
    print_table();
    Person risad = {.name="Risad", .age=21};
    Person liza = {.name="Liza", .age=17};
    Person ruksa = {.name="Ruksana", .age=21};
    hash_table_insert(&risad);
    hash_table_insert(&liza);
    hash_table_insert(&ruksa);
    print_table();
   Person *temp1 = hash_table_lookup("Risad");
   Person *temp2 = hash_table_lookup("jacob");
   Person *temp3 = hash_table_lookup("Liza");

  
    temp1 == NULL ? printf("Not Found\n") : printf("Found\n");
    temp2 == NULL ? printf("Not Found\n") : printf("Found\n");
    temp3 == NULL ? printf("Not Found\n") : printf("Found\n");

    return 0;
}