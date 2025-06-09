#!/bin/bash
set -e

# Configure IBM z/OS XL C/C++
# https://www.ibm.com/docs/en/python-zos/3.11?topic=using-cc-compilers-open-enterprise-sdk-python-311
export _CC_CCMODE=1
export _CXX_CCMODE=1
export _C89_CCMODE=1
export _CC_EXTRA_ARGS=1
export _CXX_EXTRA_ARGS=1
export _C89_EXTRA_ARGS=1

# Build object file for Metal C
# https://github.com/zowe/sample-spring-boot-api-service/blob/master/zowe-rest-api-sample-spring/zossrc/makefile
CC_OPTS="metal,langlvl(extended),sscom,nolongname,inline,genasm,inlrpt,csect,nose,lp64,list,warn64,optimize(2),list,showinc,showmacro,source,aggregate"
xlc -S -W"c,$CC_OPTS" -qlist=zmetal.c.lst -I/usr/include/metal -o zmetal.s zmetal.c
as -mrent -a=zmetal.s.lst -ISYS1.MACLIB -ICBC.SCCNSAM -o zmetal.o zmetal.s

# Create SWIG bindings for example.cpp
# https://www.swig.org/Doc4.3/Python.html#Python_nn6
swig -c++ -python example.i
python setup.py build_ext --inplace
