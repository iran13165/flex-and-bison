#include<stdio.h>
#include<stdlib.h>

struct Node
{
    int data;
    struct Node* next;
}*first = NULL;

void RDisplay(struct Node* p){
    if(p != NULL){
        printf("%d\n", p->data);
        RDisplay(p->next);
    }
}
int Count(struct Node* p){
    int count = 0;
    while(p){
        count++;
        p=p->next;
    }
    return count;
}
int Sum(struct Node* p){
    int sum = 0;
    while(p){
        sum+=p->data;
        p=p->next;
    }
    return sum;
}

void displayLinkList(struct Node *p){
    while(p != NULL){
        printf("%d\n", p->data);
        p = p->next;
    }
}
void createLinkList(int A[], int size){
      int i;
      struct Node *last, *t;
      first = (struct Node*)malloc(sizeof(struct Node));
      first->data = A[0];
      first->next = NULL;
      last = first;

      for (i = 1; i < size; i++)
      {

        t = (struct Node*)malloc(sizeof(struct Node));
        t->data = A[i];
        t->next = NULL;
        last->next = t;
        last = t;

      }
      
}
void insert(struct Node* p, int position, int value){
    struct Node* t = NULL;

    if(position==0){
        t = (struct Node*)malloc(sizeof(struct Node));
        t->data=value;
        t->next=first;    
        first = t;   
    }
    else {
        for (int i = 1; i < position; i++)
        {
            p=p->next;
        }
        if(p){
        t = (struct Node*)malloc(sizeof(struct Node));
        t->data=value;
        t->next=p->next;
        p->next=t;
        }
        
    }
}
int main(){
    int A[] = {1,2,3,4,5};
    createLinkList(A, 5);
    //RDisplay(first);
    insert(first,3,45);
    insert(first,0, 100);

    //printf("%d\n",Count(first));
    //printf("%d\n",Sum(first));
    displayLinkList(first);
    return 0;
}