# Find the local dir of the make file
GET_LOCAL_DIR    = $(patsubst %/,%,$(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))

# $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)) --》取出$(MAKEFILE_LIST)中最后的一个单词
# $(dir <text> ) 取目录函数——dir。
# 

THIS_MAKEFILE=$(abspath $(lastword $(MAKEFILE_LIST))) 
#必须放在makefile最开头，或者说放在所有 include 语句之前

#THIS_MAKEFILE=$(abspath $(firstword $(MAKEFILE_LIST)))
# 可以放在makefile的任意位置的 

# makes sure the target dir exists
MKDIR = if [ ! -d $(dir $@) ]; then mkdir -p $(dir $@); fi
