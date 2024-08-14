# Makefile for building the quicksort test

# Paths
IR_FILE := quick_sort.ll
C_FILE := test_quicksort.c
ASM_FILE := quicksort.s
EXE_FILE := test_quick_sort

HAND_FILE = hand_quicksort.s 

# Compiler flags
CLANG_FLAGS := -O3 #-gdwarf-4

COMPILER = icx #clang

# Default target
all: build_ir

# Target to build from LLVM IR
build_ir: $(IR_FILE)
	$(COMPILER) $(CLANG_FLAGS) -o $(ASM_FILE) -S -masm=intel $<
	$(COMPILER) -o $(EXE_FILE) $(C_FILE) $(ASM_FILE) $(CLANG_FLAGS)
	valgrind ./$(EXE_FILE)

# Target to build directly from assembly
build_asm: $(HAND_FILE)
	$(COMPILER) -o $(EXE_FILE) $(C_FILE) $(HAND_FILE) $(CLANG_FLAGS)
	valgrind ./$(EXE_FILE)

# Clean target
clean:
	rm -f $(ASM_FILE) $(OBJ_FILE) $(EXE_FILE)

.PHONY: all build_ir build_asm clean
