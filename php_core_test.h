/* core_test extension for PHP (c) 2022 andler.yang */

#ifndef PHP_CORE_TEST_H
# define PHP_CORE_TEST_H

extern zend_module_entry core_test_module_entry;
# define phpext_core_test_ptr &core_test_module_entry

# define PHP_CORE_TEST_VERSION "0.1.0"

# if defined(ZTS) && defined(COMPILE_DL_CORE_TEST)
ZEND_TSRMLS_CACHE_EXTERN()
# endif

PHP_FUNCTION(trigger_core_error);

#endif	/* PHP_CORE_TEST_H */
