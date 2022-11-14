dnl config.m4 for extension core_test

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

dnl PHP_ARG_WITH([core_test],
dnl   [for core_test support],
dnl   [AS_HELP_STRING([--with-core_test],
dnl     [Include core_test support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([core_test],
  [whether to enable core_test support],
  [AS_HELP_STRING([--enable-core_test],
    [Enable core_test support])],
  [no])

if test "$PHP_CORE_TEST" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, CORE_TEST_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-core_test -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/core_test.h"  # you most likely want to change this
  dnl if test -r $PHP_CORE_TEST/$SEARCH_FOR; then # path given as parameter
  dnl   CORE_TEST_DIR=$PHP_CORE_TEST
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for core_test files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       CORE_TEST_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$CORE_TEST_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the core_test distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-core_test -> add include path
  dnl PHP_ADD_INCLUDE($CORE_TEST_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-core_test -> check for lib and symbol presence
  dnl LIBNAME=CORE_TEST # you may want to change this
  dnl LIBSYMBOL=CORE_TEST # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_CORE_TEST_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your core_test library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $CORE_TEST_DIR/$PHP_LIBDIR, CORE_TEST_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_CORE_TEST_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your core_test library.])
  dnl ],[
  dnl   -L$CORE_TEST_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(CORE_TEST_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_CORE_TEST, 1, [ Have core_test support ])

  PHP_NEW_EXTENSION(core_test, core_test.c, $ext_shared)
fi
