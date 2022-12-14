/* core_test extension for PHP (c) 2022 andler.yang */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include "php.h"
#include "ext/standard/info.h"
#include "php_core_test.h"

/* For compatibility with older PHP versions */
#ifndef ZEND_PARSE_PARAMETERS_NONE
#define ZEND_PARSE_PARAMETERS_NONE() \
	ZEND_PARSE_PARAMETERS_START(0, 0) \
	ZEND_PARSE_PARAMETERS_END()
#endif

/* {{{ void core_test_test1()
 */
PHP_FUNCTION(core_test_test1)
{
	ZEND_PARSE_PARAMETERS_NONE();

	php_printf("The extension %s is loaded and working!\r\n", "core_test");
}
/* }}} */

/* {{{ string core_test_test2( [ string $var ] )
 */
PHP_FUNCTION(core_test_test2)
{
	char *var = "World";
	size_t var_len = sizeof("World") - 1;
	zend_string *retval;

	ZEND_PARSE_PARAMETERS_START(0, 1)
		Z_PARAM_OPTIONAL
		Z_PARAM_STRING(var, var_len)
	ZEND_PARSE_PARAMETERS_END();

	retval = strpprintf(0, "Hello %s", var);

	RETURN_STR(retval);
}
/* }}}*/

/* {{{ PHP_RINIT_FUNCTION
 */
PHP_RINIT_FUNCTION(core_test)
{
#if defined(ZTS) && defined(COMPILE_DL_CORE_TEST)
	ZEND_TSRMLS_CACHE_UPDATE();
#endif

	return SUCCESS;
}
/* }}} */

/* {{{ PHP_MINFO_FUNCTION
 */
PHP_MINFO_FUNCTION(core_test)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "core_test support", "enabled");
	php_info_print_table_end();
}
/* }}} */

/* {{{ arginfo
 */
ZEND_BEGIN_ARG_INFO(arginfo_core_test_test1, 0)
ZEND_END_ARG_INFO()

ZEND_BEGIN_ARG_INFO(arginfo_core_test_test2, 0)
	ZEND_ARG_INFO(0, str)
ZEND_END_ARG_INFO()
/* }}} */

/* {{{ core_test_functions[]
 */
static const zend_function_entry core_test_functions[] = {
	PHP_FE(core_test_test1,		arginfo_core_test_test1)
	PHP_FE(core_test_test2,		arginfo_core_test_test2)
	PHP_FE(trigger_core_error, NULL)
	PHP_FE_END
};
/* }}} */

/* {{{ core_test_module_entry
 */
zend_module_entry core_test_module_entry = {
	STANDARD_MODULE_HEADER,
	"core_test",					/* Extension name *\] 
	core_test_functions,			/* zend_function_entry */
	NULL,							/* PHP_MINIT - Module initialization */
	NULL,							/* PHP_MSHUTDOWN - Module shutdown */
	PHP_RINIT(core_test),			/* PHP_RINIT - Request initialization */
	NULL,							/* PHP_RSHUTDOWN - Request shutdown */
	PHP_MINFO(core_test),			/* PHP_MINFO - Module info */
	PHP_CORE_TEST_VERSION,		/* Version */
	STANDARD_MODULE_PROPERTIES
};
/* }}} */

/*{{ tl_get_arch
 */
PHP_FUNCTION(trigger_core_error)
{
    zend_error_noreturn(E_CORE_ERROR, "core error triggered from trigger_core_error");
}
/* }}} */

#ifdef COMPILE_DL_CORE_TEST
# ifdef ZTS
ZEND_TSRMLS_CACHE_DEFINE()
# endif
ZEND_GET_MODULE(core_test)
#endif
