#include<stdio.h>
struct Student
{
    char* name;
    int marks;
};
int main(){
    int A[] = {1,2,3,4,5};
    int *p = A;
    int **p = &A;
    printf("array=%d\n arr A = %d\n, array of pointer = %d\n, **P=%d\n", p,A,&p, **p);
    return 0;
}
