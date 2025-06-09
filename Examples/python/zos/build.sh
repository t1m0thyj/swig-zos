#!/bin/bash
set -ex
export _CC_CCMODE=1
export _CXX_CCMODE=1
export _C89_CCMODE=1
export _CC_EXTRA_ARGS=1
export _CXX_EXTRA_ARGS=1
export _C89_EXTRA_ARGS=1
# xlc -S -qmetal -q64 -qlongname -o zmetal.s zmetal.c
# as -mgoff -o zmetal.o zmetal.s
# xlc -c -qxplink -q64 -qlongname -o zmetal.o zmetal.s
xlc -S -qmetal -q64 -g1 -o zmetal.s zmetal.c
as -mRENT -ISYS1.MACLIB -ISYS1.MODGEN -ICBC.SCCNSAM -o zmetal.o zmetal.s
# ar -rv libmetal.a metal.o # rcs
swig -c++ -python example.i
python setup.py build_ext --inplace
