#!/bin/bash

# Path to the quick_sort LLVM IR file
IR_FILE="quick_sort.ll"
# Path to the C test file
C_FILE="test_quicksort.c"
# Output names
ASM_FILE="quicksort.s"
OBJ_FILE="quicksort.s"
EXE_FILE="test_quick_sort"

clang $IR_FILE -g3 -gdwarf-4 -o  $ASM_FILE -S -masm=intel 
nasm -g $ASM_FILE -o $OBJ_FILE

clang -o $EXE_FILE $C_FILE $OBJ_FILE -g3 -gdwarf-4
valgrind ./$EXE_FILE
