function unit_test_Strings() {
	if (!script_exists(asset_get_index("string_split"))) {
		log("Skipped unit tests for \"Strings\": Not in project.");
		return;
	}

	var ut = new UnitTest("Strings");
	
	ut.tests.sprintf_ok		= function(test, data) {
		var t = sprintf("{{0}+{1}={2}}", 1, 1, 2);
		test.assert_equals("{1+1=2}", t);
	};

	ut.tests.trim_ok		= function(test, data) {
		var t = string_trim(" \t\na\nb\t  , ");
		test.assert_equals("a\nb\t  ,", t);
	};

	ut.tests.skip_start_ok	= function(test, data) {
		var t = string_skip_start("1234567890", 1);
		test.assert_equals("234567890", t, "skip 1");
		
		t = string_skip_start("1234567890", 3);
		test.assert_equals("4567890", t, "skip 3");
	};

	ut.tests.skip_end_ok	= function(test, data) {
		var t = string_skip_end("1234567890", 1);
		test.assert_equals("123456789", t, "skip 1");
		
		t = string_skip_end("1234567890", 3);
		test.assert_equals("1234567", t, "skip 3");
	};

	ut.tests.starts_with_ok	= function(test, data) {
		test.assert_true(string_starts_with("1234567890", "123"));
		test.assert_false(string_starts_with("1234567890", "012"));
	};

	ut.tests.ends_with_ok	= function(test, data) {
		test.assert_true(string_ends_with("1234567890", "890"));
		test.assert_false(string_ends_with("1234567890", "789"));
	};

	ut.tests.is_empty_ok	= function(test, data) {
		test.assert_true(string_is_empty(undefined));
		test.assert_true(string_is_empty(""));
		test.assert_true(string_is_empty(" \t\n"));
	};

	ut.tests.contains_ok	= function(test, data) {
		test.assert_true(string_contains("1234567890", "890"));
		test.assert_true(string_contains("1234567890", "456"));
		test.assert_false(string_contains("1234567890", "4456"));
	};

	ut.tests.parse_hex_ok	= function(test, data) {
		test.assert_equals(255, string_parse_hex("$FF"));
		test.assert_equals(49152, string_parse_hex("C000"));
	};

	ut.tests.convert_hex_ok	= function(test, data) {
		test.assert_equals("FF", string_get_hex(255));
		test.assert_equals("00ff", string_get_hex(255,4,false));
		test.assert_equals("c000", string_get_hex(49152,,false));
	};

	ut.run();
}
