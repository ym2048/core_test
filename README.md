# core_test
php core_error 级别的错误并不好复现。

本扩展提供了以下函数，可以触发 core_error 错误，方便研究此错误产生后的程序的行为。

trigger_core_error  无参数，无返回值，触发 E_CORE_ERROR 
