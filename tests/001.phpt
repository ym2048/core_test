--TEST--
Check if core_test is loaded
--SKIPIF--
<?php
if (!extension_loaded('core_test')) {
	echo 'skip';
}
?>
--FILE--
<?php
echo 'The extension "core_test" is available';
?>
--EXPECT--
The extension "core_test" is available
