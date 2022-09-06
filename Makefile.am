################################################################################

# Set Up Java Variables
JAVAC = @JAVA_CC@
JAVAC_OPTS = @JAVA_CC_OPTS@
JAVADOC = @JAVADOC@
JAR = @JAR@
MYJAVAPKG = @MYJAVAPKG@
MYJAVADIR = $(builddir)/share/java
MYJAVAPKGDIR = $(MYJAVADIR)/$(MYJAVAPKG)
javadir = $(datadir)/java
################################################################################

# Set Up Other Variables

## Enable local m4 cache
ACLOCAL_AMFLAGS = -I m4

## Documentation Compilation
info_TEXINFOS = doc/java-cdr255.texi

## Extra Files for Distribution
EXTRA_DIST =  Changelog.md \
              LICENSE \
              COPYING \
              NEWS \
              AUTHORS \
              README.org \
              README.md \
              Changelog.md \
              ChangeLog \
              COPYING \
              m4/tar-edited.m4 \
              guix.scm \
              doc/version.texi.in \
              doc/fdl-1.3.texi \
              doc/procedure-types.texi

## Cleaning Up

### Filelist for make clean
CLEANFILES =					\
  $(JAVACLASSES)				
################################################################################

# Define Inputs

## Define Java files (PREFIX: JAVAFILE)
JAVAFILEONE = $(srcdir)/cdr255/io/Input.java
JAVASOURCES = $(JAVAFILEONE)

## Define Java classes
JAVACLASSES = $(JAVASOURCES:%.java=%.class)


## Don't Distribute, Don't Install
#nodist_noinst_SCRIPTS = 
################################################################################

# Define Outputs

# ## Jarfiles and Classes
java_DATA = cdr255.jar

## Symlinks Can Go Here, along with other end-of-install changes
# install-data-hook:
# 	$(LN_S) $(DESTDIR)$(bindir)/realfile $(DESTDIR)$(bindir)/link
# 	chmod +x $(DESTDIR)$(javadir)/java-cdr255.jar

## Sources and Extras
EXTRA_DIST += $(JAVASOURCES)
################################################################################

# Added Jobs

cdr255.jar: $(MYJAVAPKGDIR)/io/Input.class
	$(JAR) cfe cdr255.jar $(MYJAVAPKG).io.Input \
	-C $(MYJAVADIR) $(MYJAVAPKG)/io/Input.class

$(MYJAVAPKGDIR)/io/Input.class: $(JAVAFILEONE)
	$(MKDIR_P) $(MYJAVADIR)
	$(JAVAC) $(JAVAC_OPTS) -d $(MYJAVADIR) $(JAVAFILEONE)
################################################################################

# # Tests (Not Working Right Now, as \$\(srcdir\) is not allowed.).
# TESTS = tests/tests.scm

# TEST_EXTENSIONS = .scm
# SCM_LOG_DRIVER =                                \
#   $(top_builddir)/pre-inst-env                  \
#   $(GUILE) --no-auto-compile -e main            \
#       $(top_srcdir)/build-aux/test-driver.scm

# # Tell 'build-aux/test-driver.scm' to display only source file names,
# # not indivdual test names.
# AM_SCM_LOG_DRIVER_FLAGS = --brief=yes

# AM_SCM_LOG_FLAGS = --no-auto-compile -L "$(top_srcdir)"

# AM_TESTS_ENVIRONMENT = abs_top_srcdir="$(abs_top_srcdir)"
