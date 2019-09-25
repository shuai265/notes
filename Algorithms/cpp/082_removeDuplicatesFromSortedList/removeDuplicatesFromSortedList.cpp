/*
Given 1->2->3->3->4->4->5, return 1->2->5.
Given 1->1->1->2->3, return 2->3.
*/

#include <stdio.h>
#include <iostream>
using namespace std;

class Node
{
private:
    int value;
    Node* next;
public:
    Node(int v) {
        value = v;
        next = NULL;
    };
};

void deDup(int &data) {

}

void logList(Node *head) {

}

int main(){
    int data[] = { 1,2,3,3,4,4,5 };

    return 0;
}