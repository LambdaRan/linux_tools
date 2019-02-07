#
# makefile for x86
#

TOPDIR = .
#NAME = x86-Client
NAME = arm-airapp
CROSS =/mnt/dpartion/share/develop/6ul/gcc-linaro-arm-linux-gnueabihf-4.7-2012.12-20121214_linux/bin/arm-linux-gnueabihf-
#CROSS =
DEBUG = 1
BINARY = exec
TARGET ?= airapp
INSTALL_PATH = .

SRCPATH = $(TOPDIR)
SRCSUBDIR = osal/inc 	\
	osal/src 	\
	drv 			\
	http 			\
	json 			\
	common 			\
	app 			\
	app/device 			\
	app/netapp 			\
	app/config 			\
	app/db 			\
	app/netRTSP/Source \
	app/netRTSP/Source/Client \
	app/netRTSP/Inc 	\
	media				\
	ftp					\

INCDIR = $(TOPDIR)/osal/inc 	\
	 $(TOPDIR)/drv 			\
	 $(TOPDIR)/http 			\
	 $(TOPDIR)/json 			\
	 $(TOPDIR)/common 			\
	 $(TOPDIR)/app 			\
	 $(TOPDIR)/app/device 			\
	 $(TOPDIR)/app/netapp 			\
	 $(TOPDIR)/app/config 			\
	 $(TOPDIR)/app/db 			\
	 $(TOPDIR)/app/netRTSP/Source \
	 $(TOPDIR)/app/netRTSP/Source/Client \
	 $(TOPDIR)/app/netRTSP/Inc 	\
	 $(TOPDIR)/media		 	\
	 $(TOPDIR)/ftp		 	\



CFLAGS += -Wall -D__STDC_CONSTANT_MACROS

LIBDIR = $(TOPDIR)/lib
LIBS = pthread onvif sqlite3
USER_LIBS =
LDFLAGS = -ldl
#STL_PATH=$(NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.6/libs/armeabi-v7a
#LOCAL_LDLIBS += -L$(STL_PATH) -lsupc++

include common.mk
