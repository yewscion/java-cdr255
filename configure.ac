dnl Process this file with autoconf
AC_INIT([java-cdr255],
        [0.0.1],
        [yewscion@gmail.com],
        [java-cdr255],
        [https://sr.ht/~yewscion/java-cdr255])

dnl General Project Variables
AC_SUBST(LICENSE, ["Copyright (C) 2022 Christopher Rodriguez

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.

"])
_AM_SUBST_NOTMAKE([LICENSE])
AC_CONFIG_SRCDIR([README.md])
AC_CONFIG_AUX_DIR([build-aux])

dnl Set Up Automake
AM_INIT_AUTOMAKE([-Wall -Werror -Wportability gnu check-news dist-bzip2
filename-length-max=99 std-options])

dnl Set Up Java
AC_PROG_CC
AX_CHECK_CLASSPATH
AX_PROG_JAVA_CC
AX_PROG_JAVAC
AX_PROG_JAVA
AX_PROG_JAR
AX_PROG_JAVADOC
AC_SUBST(MYJAVAPKG, [cdr255])

AC_SUBST(JAVA_CC_OPTS, ["-encoding UTF-8"])

dnl Checks for classes
dnl AX_CHECK_RQRD_CLASS(org.whatever)

dnl Finishing Up
AC_PROG_LN_S
AC_PROG_MKDIR_P
AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([doc/version.texi])
AC_OUTPUT
