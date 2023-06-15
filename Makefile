# Makefile to copy files from one location to another

# Default target
all: copy_files

EMACS_SRC_DIR = ~/.emacs.d
EMACS_DEST_DIR = emacs.d
EMACS_LISP_SRC_DIR = ~/.emacs.d/lisp
FILES := init.el


# Target to copy files
copy_files:
	@echo "Copying files..."
	@cp $(addprefix $(EMACS_SRC_DIR)/, $(FILES)) $(EMACS_DEST_DIR)
	@echo "Files copied successfully"

