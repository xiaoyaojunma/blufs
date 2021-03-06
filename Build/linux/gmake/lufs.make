# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug32
endif

ifndef verbose
  SILENT = @
endif

CC = gcc
CXX = g++
AR = ar

ifndef RESCOMP
  ifdef WINDRES
    RESCOMP = $(WINDRES)
  else
    RESCOMP = windres
  endif
endif

ifeq ($(config),debug32)
  OBJDIR     = ../../../obj/linux/gmake/x32/Debug/lufs/x32
  TARGETDIR  = ../../../bin/linux/gmake/x32/Debug
  TARGET     = $(TARGETDIR)/lufs
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DDEBUG -D_DEBUG
  INCLUDES  += -I../../../deps/luabind -I../../../deps/Catch/single_include -I../../../deps/LuaState/include -I../../../deps/lua/lua-5.3.0/src
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m32 -std=c++0x -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake/x32/Debug -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/linux/gmake/x32/Debug/libluabind.a ../../../bin/linux/gmake/x32/Debug/libcustom_lua.a ../../../bin/linux/gmake/x32/Debug/lua5.3.so
  LIBS      += $(LDDEPS) -lboost_system -lpthread -lboost_filesystem -ldl -lreadline
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release32)
  OBJDIR     = ../../../obj/linux/gmake/x32/Release/lufs/x32
  TARGETDIR  = ../../../bin/linux/gmake/x32/Release
  TARGET     = $(TARGETDIR)/lufs
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DRELEASE
  INCLUDES  += -I../../../deps/luabind -I../../../deps/Catch/single_include -I../../../deps/LuaState/include -I../../../deps/lua/lua-5.3.0/src
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m32 -std=c++0x -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake/x32/Release -s -m32 -L/usr/lib32
  LDDEPS    += ../../../bin/linux/gmake/x32/Release/libluabind.a ../../../bin/linux/gmake/x32/Release/libcustom_lua.a ../../../bin/linux/gmake/x32/Release/lua5.3.so
  LIBS      += $(LDDEPS) -lboost_system -lpthread -lboost_filesystem -ldl -lreadline
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug64)
  OBJDIR     = ../../../obj/linux/gmake/x64/Debug/lufs/x64
  TARGETDIR  = ../../../bin/linux/gmake/x64/Debug
  TARGET     = $(TARGETDIR)/lufs
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DDEBUG -D_DEBUG
  INCLUDES  += -I../../../deps/luabind -I../../../deps/Catch/single_include -I../../../deps/LuaState/include -I../../../deps/lua/lua-5.3.0/src
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -m64 -std=c++0x -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake/x64/Debug -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/linux/gmake/x64/Debug/libluabind.a ../../../bin/linux/gmake/x64/Debug/libcustom_lua.a ../../../bin/linux/gmake/x64/Debug/lua5.3.so
  LIBS      += $(LDDEPS) -lboost_system -lpthread -lboost_filesystem -ldl -lreadline
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release64)
  OBJDIR     = ../../../obj/linux/gmake/x64/Release/lufs/x64
  TARGETDIR  = ../../../bin/linux/gmake/x64/Release
  TARGET     = $(TARGETDIR)/lufs
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DRELEASE
  INCLUDES  += -I../../../deps/luabind -I../../../deps/Catch/single_include -I../../../deps/LuaState/include -I../../../deps/lua/lua-5.3.0/src
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -m64 -std=c++0x -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake/x64/Release -s -m64 -L/usr/lib64
  LDDEPS    += ../../../bin/linux/gmake/x64/Release/libluabind.a ../../../bin/linux/gmake/x64/Release/libcustom_lua.a ../../../bin/linux/gmake/x64/Release/lua5.3.so
  LIBS      += $(LDDEPS) -lboost_system -lpthread -lboost_filesystem -ldl -lreadline
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),debug)
  OBJDIR     = ../../../obj/linux/gmake/Native/Debug/lufs
  TARGETDIR  = ../../../bin/linux/gmake
  TARGET     = $(TARGETDIR)/lufs
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DDEBUG -D_DEBUG
  INCLUDES  += -I../../../deps/luabind -I../../../deps/Catch/single_include -I../../../deps/LuaState/include -I../../../deps/lua/lua-5.3.0/src
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -g -std=c++0x -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake
  LDDEPS    += ../../../bin/linux/gmake/libluabind.a ../../../bin/linux/gmake/libcustom_lua.a ../../../bin/linux/gmake/lua5.3.so
  LIBS      += $(LDDEPS) -lboost_system -lpthread -lboost_filesystem -ldl -lreadline
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = ../../../obj/linux/gmake/Native/Release/lufs
  TARGETDIR  = ../../../bin/linux/gmake
  TARGET     = $(TARGETDIR)/lufs
  DEFINES   += -DBOOST_NO_VARIADIC_TEMPLATES -DRELEASE
  INCLUDES  += -I../../../deps/luabind -I../../../deps/Catch/single_include -I../../../deps/LuaState/include -I../../../deps/lua/lua-5.3.0/src
  ALL_CPPFLAGS  += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS    += $(CFLAGS) $(ALL_CPPFLAGS) $(ARCH) -O2 -std=c++0x -fPIC
  ALL_CXXFLAGS  += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS  += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  ALL_LDFLAGS   += $(LDFLAGS) -L. -L../../../bin/linux/gmake -s
  LDDEPS    += ../../../bin/linux/gmake/libluabind.a ../../../bin/linux/gmake/libcustom_lua.a ../../../bin/linux/gmake/lua5.3.so
  LIBS      += $(LDDEPS) -lboost_system -lpthread -lboost_filesystem -ldl -lreadline
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(RESOURCES) $(ARCH) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/blufs_lib.o \
	$(OBJDIR)/lufs_init.o \
	$(OBJDIR)/resource.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking lufs
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning lufs
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -MMD -MP $(DEFINES) $(INCLUDES) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/blufs_lib.o: ../../../src/blufs_lib.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/lufs_init.o: ../../../src/lufs_init.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

$(OBJDIR)/resource.o: ../../../src/resource.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF $(@:%.o=%.d) -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
