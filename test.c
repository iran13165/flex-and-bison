#include<stdio.h>
#include<stdlib.h>

struct Student
{
    char* name;
    int marks;
};
struct Student stTable[10];
int main(){
    struct Student* s;
    struct Student f= {"name 2",88};
     s = &f;
     stTable[0] = f;
     stTable[9] = *s;
   printf("%s\n",stTable[9].name);
    return 0;
}
