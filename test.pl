# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}
use Ska::Convert qw(:all);
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

$test = 2;

print "$test:  dec2hms\n";
($rah, $dms) = dec2hms(123.456, 54.321);
$ok = ($rah eq '8:13:49.440' && $dms eq '+54:19:15.60');
print $ok ? "ok" : "not ok", " ", $test++, "\n";

print "$test:  time2date\n";
$ok = (time2date(12345678.9) eq '1998:143:21:20:15.716');
print $ok ? "ok" : "not ok", " ", $test++, "\n";

print "$test:  time2date unix mode\n";
$ok = (time2date(895958415, 'unix') eq '1998:143:21:20:15.000');
print $ok ? "ok" : "not ok", " ", $test++, "\n";

print "$test:  date2time\n";
$ok = (abs(date2time('1998:143:21:20:15.716') - 12345678.900000000) < 1e-15);
print $ok ? "ok" : "not ok", " ", $test++, "\n";

print "$test:  date2time unix mode\n";
$ok = (abs(date2time('1998:143:21:20:15.716', 'unix') - 895958415.716) < 1e-15);
print $ok ? "ok" : "not ok", " ", $test++, "\n";

print "$test:  date2time relative mode\n";
$ok = (abs(date2time('000:00:00:15.000') - 15) < 1e-15);
print $ok ? "ok" : "not ok", " ", $test++, "\n";

