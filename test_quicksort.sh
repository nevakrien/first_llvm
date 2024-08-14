#!/bin/bash

# Path to the quick_sort LLVM IR file
IR_FILE="quick_sort.ll"
C_FILE="test_quicksort.c"
OBJ_FILE="quicksort.s"
EXE_FILE="test_quick_sort"

clang $IR_FILE -g3 -gdwarf-4 -o  $OBJ_FILE -S -masm=intel 

clang -o $EXE_FILE $C_FILE $OBJ_FILE -g3 -gdwarf-4
valgrind ./$EXE_FILE
