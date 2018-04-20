#include<iostream>
#include<string>

#ifndef COMPREEE_H
#define COMPRESS_H
#include "huffman.h"

char str2byte(string cd);
int encode(const char *name,const HuffmanCode &HC,char pbuffer[],const int Size,string filename);
int compress(const char *name);

#endif
#pragma once