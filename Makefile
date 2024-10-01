SRC_DIR = src
OUT_DIR = out


# wildcard is a function from makefile
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)

# This transforms every src/file to out/file and
# (SRC_FILES:.c=) is a way to do variable substitution in makefiles $(var:pattern=replacement)
# We change every path of src/file1.c to src/file1 and then we do the change to out/file1
OUTPUT_FILES := $(patsubst $(SRC_DIR)/%, $(OUT_DIR)/%, $(SRC_FILES:.c=))


all: $(OUTPUT_FILES)

# $<: represent the first pre requisite of the rule (src/file1) etc
# $@: represent target file of the current rule. in this case out/file 
${OUT_DIR}/%: $(SRC_DIR)/%.c
	@mkdir -p $(OUT_DIR)
	gcc -Wall -std=c99 $< -o $@

clean:
	rm -f $(OUT_DIR)/*

# indicates that clean: and all: are not target files they are commands
.PHONY: all clean