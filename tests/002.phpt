--TEST--
core_test_test1() Basic test
--SKIPIF--
<?php
if (!extension_loaded('core_test')) {
	echo 'skip';
}
?>
--FILE--
<?php
$ret = core_test_test1();

var_dump($ret);
?>
--EXPECT--
The extension core_test is loaded and working!
NULL
