#include <iostream>
using namespace std;
#ifndef HUFFMAN_H
#define HUFFMAN_H

/*¹þ·òÂüÊ÷½Úµã*/
typedef struct 
{
	int weight;
	int parent;
	int lchild;
	int rchild;
}HuffmanNode,*HuffmanTree;

typedef char **HuffmanCode;
int min1st(HuffmanTree &HT,int size);
int min2rd(HuffmanTree &HT,int s1,int i);
void Select(HuffmanTree &HT,int i,int &s1,int &s2);
int selectBalance(HuffmanTree pHT, int size);
void HuffmanCoding(HuffmanTree &HT,HuffmanCode &HC,int *w,int n);
string dec2hex(int i);

#endif
