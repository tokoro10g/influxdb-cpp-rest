# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug_x32
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug_x32)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x32/Debug
  TARGET = $(TARGETDIR)/demo
  OBJDIR = ../../../obj/macosx/gmake/x32/Debug/demo
  DEFINES += -D_DEBUG
  INCLUDES += -I../../../deps/fmt -I../../../deps/rxcpp/Rx/v2/src/rxcpp -I../../../src/influxdb-cpp-rest -I/usr/local/include -I/usr/local/opt/openssl/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g -std=c++14
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../bin/macosx/gmake/x32/Debug/libinfluxdb-cpp-rest.a ../../../bin/macosx/gmake/x32/Debug/libfmt.a -lssl -lcrypto -lcpprest -lboost_thread-mt -lboost_system-mt -lboost_chrono
  LDDEPS += ../../../bin/macosx/gmake/x32/Debug/libinfluxdb-cpp-rest.a ../../../bin/macosx/gmake/x32/Debug/libfmt.a
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -L/usr/local/lib -L/usr/local/opt/openssl/lib -m32
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x64)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x64/Debug
  TARGET = $(TARGETDIR)/demo
  OBJDIR = ../../../obj/macosx/gmake/x64/Debug/demo
  DEFINES += -D_DEBUG
  INCLUDES += -I../../../deps/fmt -I../../../deps/rxcpp/Rx/v2/src/rxcpp -I../../../src/influxdb-cpp-rest -I/usr/local/include -I/usr/local/opt/openssl/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -std=c++14
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../bin/macosx/gmake/x64/Debug/libinfluxdb-cpp-rest.a ../../../bin/macosx/gmake/x64/Debug/libfmt.a -lssl -lcrypto -lcpprest -lboost_thread-mt -lboost_system-mt -lboost_chrono
  LDDEPS += ../../../bin/macosx/gmake/x64/Debug/libinfluxdb-cpp-rest.a ../../../bin/macosx/gmake/x64/Debug/libfmt.a
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -L/usr/local/lib -L/usr/local/opt/openssl/lib -m64
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x32)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x32/Release
  TARGET = $(TARGETDIR)/demo
  OBJDIR = ../../../obj/macosx/gmake/x32/Release/demo
  DEFINES +=
  INCLUDES += -I../../../deps/fmt -I../../../deps/rxcpp/Rx/v2/src/rxcpp -I../../../src/influxdb-cpp-rest -I/usr/local/include -I/usr/local/opt/openssl/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O2 -std=c++14
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../bin/macosx/gmake/x32/Release/libinfluxdb-cpp-rest.a ../../../bin/macosx/gmake/x32/Release/libfmt.a -lssl -lcrypto -lcpprest -lboost_thread-mt -lboost_system-mt -lboost_chrono
  LDDEPS += ../../../bin/macosx/gmake/x32/Release/libinfluxdb-cpp-rest.a ../../../bin/macosx/gmake/x32/Release/libfmt.a
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -L/usr/local/lib -L/usr/local/opt/openssl/lib -m32 -Wl,-x
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x64)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x64/Release
  TARGET = $(TARGETDIR)/demo
  OBJDIR = ../../../obj/macosx/gmake/x64/Release/demo
  DEFINES +=
  INCLUDES += -I../../../deps/fmt -I../../../deps/rxcpp/Rx/v2/src/rxcpp -I../../../src/influxdb-cpp-rest -I/usr/local/include -I/usr/local/opt/openssl/include
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -std=c++14
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += ../../../bin/macosx/gmake/x64/Release/libinfluxdb-cpp-rest.a ../../../bin/macosx/gmake/x64/Release/libfmt.a -lssl -lcrypto -lcpprest -lboost_thread-mt -lboost_system-mt -lboost_chrono
  LDDEPS += ../../../bin/macosx/gmake/x64/Release/libinfluxdb-cpp-rest.a ../../../bin/macosx/gmake/x64/Release/libfmt.a
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -L/usr/local/lib -L/usr/local/opt/openssl/lib -m64 -Wl,-x
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/main.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES) ${CUSTOMFILES}
	@echo Linking demo
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
	@echo Cleaning demo
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
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/main.o: ../../../src/demo/main.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
