LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += \
		-I$(LOCAL_DIR) \
		-I$(TOP_DIR)/muduo/base

MODULES += \
	muduo/base

OBJS += \
	$(LOCAL_DIR)/AsyncLogging_test.o 