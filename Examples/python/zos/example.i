/* File: example.i */
%module example

%{
#include "example.h"
%}

int fact(int n);
int my_mod(int x, int y);
