#include <stdio.h> 
#include <stdlib.h>


struct node{
	int val;
	struct node *nxt;
};

struct node *head = NULL;

void print_reverse(struct node *tmp){
	if(tmp==NULL) return; 
	print_reverse(tmp->nxt); 
	printf("%d ",tmp->val);
}
 
void reverse(struct node *tmp){
	if(tmp->nxt==NULL){
		head = tmp; 
		head->nxt = NULL; 
		return;	
	} 
	reverse(tmp->nxt);
        struct node *it = tmp->nxt; 
	it->nxt = tmp; 
	tmp->nxt = NULL;	
}


void showlist(struct node *tmp){
	if(tmp==NULL) return; 
	printf("%d ",tmp->val);
	showlist(tmp->nxt);
} 

int main(){
	int n; 
	struct node *tmp = NULL;
	scanf("%d",&n); 
	for(int i =0;i<n;i++){
		int x;
		scanf("%d",&x);		
		if(i==0){
			head = malloc(sizeof(struct node));
			head->val = x; 
			head->nxt = NULL;
			tmp = head;
		}else{
			tmp->nxt = malloc(sizeof(struct node)); 
			tmp = tmp->nxt; 
			tmp->val = x; 
			tmp->nxt = NULL;
		}
	}
	reverse(head);
	showlist(head);
	return 0;	
}
