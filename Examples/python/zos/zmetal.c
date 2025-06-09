/* File: zmetal.c */

#include "zmetal.h"

#pragma prolog(MODULUS, "&CCN_MAIN SETB 1 \n MYPROLOG")
#pragma linkage(MODULUS, OS)

int MODULUS(int x, int y) {
    return (x%y);
}
