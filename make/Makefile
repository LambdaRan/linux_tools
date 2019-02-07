ifeq ($(MAKECMDGOALS),spotless)
spotless:
	rm -rf build-*
else

START_TIME := $(shell date +%Y-%m-%d_%H:%M:%S)

-include local.mk
include make/macros.mk

PROJECT := muduo
TARGET := main
ARCH := x86

TOP_DIR:= .
BUILDDIR := $(TOP_DIR)/build-$(PROJECT)

# setup toolchain prefix
TOOLCHAIN_PREFIX ?= 
# tool chain
CXX	= $(TOOLCHAIN_PREFIX)g++
CC	= $(TOOLCHAIN_PREFIX)gcc
LD	= $(TOOLCHAIN_PREFIX)ld
AR  = $(TOOLCHAIN_PREFIX)ar
RM	= rm -f
STRIP = $(TOOLCHAIN_PREFIX)strip


COMFLAGS := -Wall -g -Wextra -Werror -Wconversion -Wshadow
CFLAGS	 := $(COMFLAGS) -std=c11
CXXFLAGS := $(COMFLAGS) -std=c++11

INCLUDES := -I.
LIBS := -lpthread
OBJS :=
ALLMODULES :=
MODULES := 

include app/rules.mk
# recursively include any modules in the MODULE variable, leaving a trail of included
# modules in the ALLMODULES list
include make/module.mk

# # # default to no ccache
# CCACHE ?= 
# CC := $(CCACHE) $(TOOLCHAIN_PREFIX)gcc
# ifeq ($(LD),ld)
# LD := $(TOOLCHAIN_PREFIX)ld
# endif
# STRIP := $(TOOLCHAIN_PREFIX)strip
# OBJDUMP := $(TOOLCHAIN_PREFIX)objdump
# OBJCOPY := $(TOOLCHAIN_PREFIX)objcopy
# CPPFILT := $(TOOLCHAIN_PREFIX)c++filt
# SIZE := $(TOOLCHAIN_PREFIX)size
# NM := $(TOOLCHAIN_PREFIX)nm

ALLOBJS := $(OBJS)
ALLOBJS := $(addprefix $(BUILDDIR)/,$(ALLOBJS))

# comment out or override if you want to see the full output of each command
NOECHO ?=  

# 编译之前调用
DEPS := $(ALLOBJS:%o=%d)
# the logic to compile and link stuff is in here
include make/build.mk 

# entry
all: start $(TARGET) end
	
start:
	@echo [[[ START $(PROJECT) $(TARGET) ]]]
end:
	@echo [[[ THE END ]]]
	@echo [[[ Start-Time: $(START_TIME) ]]]
	@echo [[[ End---Time: $(shell date +%Y-%m-%d_%H:%M:%S) ]]]
$(TARGET) : $(ALLOBJS) $(LIBS)
	@echo compiling $<
	$(CXX) $(CXXFLAGS)  $^ -o $@

.PHONY: install
install: all
	@echo "install"
# Empty rule for the .d files. The above rules will build .d files as a side
# effect. Only works on gcc 3.x and above, however.
%.d:

ifeq ($(filter $(MAKECMDGOALS), clean), )
-include $(DEPS)
endif

.PHONY: clean
clean: $(EXTRA_CLEANDEPS)
	$(RM) $(ALLOBJS) $(DEPS)

endif # make spotless
