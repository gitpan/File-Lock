#!/usr/local/bin/perl

use strict;
use File::Lock;

my $version = File::Lock::Version();
print "testing File::Lock v${version}\n";

print "Testing locking code...\n";
my $n = 1;
while($n < 3){
	print "Attempting lock [$n/2]\n";
	my $result = File::Lock::lock(file => 'test.pl', timeout => 2, debug => 0);
	if($result) {
		print "file could not be locked - result code: $result -- this is ";
		if($n == 1){
			print "bad\n";
			exit 1;
		}else{
			print "good\n";
		}
	}else{
		print "file locked -- this is ";
		if($n == 1){
			print "good\n";
		}else{
			print "bad\n";
			exit 1;
		}
	}
	$n++;
}
if(my $result = File::Lock::check('test.pl')){
	print "file not locked, error: $result\n";
	exit 1;
}else{
	print "Status: file is locked\n";
}

if(my $result = File::Lock::unlock('test.pl')){
	print "could not unlock file: $result\n";
	exit 1;
}else{
	print "file unlocked\n";
}
print "all tests completed sucessfully.\n"
