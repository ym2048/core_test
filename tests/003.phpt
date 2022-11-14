--TEST--
core_test_test2() Basic test
--SKIPIF--
<?php
if (!extension_loaded('core_test')) {
	echo 'skip';
}
?>
--FILE--
<?php
var_dump(core_test_test2());
var_dump(core_test_test2('PHP'));
?>
--EXPECT--
string(11) "Hello World"
string(9) "Hello PHP"
