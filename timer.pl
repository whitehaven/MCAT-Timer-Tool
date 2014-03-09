#whitehaven MCAT Utilities
use strict;
use warnings;

print("Welcome to MCAT Timer Tool\n");

print("Hours to run:");
my $hours = <STDIN>;

print("Minutes to run:");
my $minutes=<STDIN>;

print("Seconds to run:");
my $seconds=<STDIN>;

my $countdown = $hours*60*60 + $minutes*60 + $seconds; # go to time in secs.

$| = 1;

my $beg_time = time;
my $end_time = $beg_time + $countdown;

system('clear');

for (;;) 
{
   my $time = time;
   last if ($time >= $end_time);
   
   #Print time
   system('clear');
   
   printf("%02d:%02d:%02d",
      ($end_time - $time) / (60*60),		#hours
      ($end_time - $time) / (   60) % 60,	#minutes
	  ($end_time - $time)           % 60,	#seconds
   );
   
   #Print question name
   print("\n\nYou should be on question: ", (( $time - $beg_time )/ 60 % 60 ) + 1); #Time since beginning (seconds) / 60 -> T since beginning (minutes) % 60 -> +1 fixes for non-0 question start
  
   if ($end_time - $time <= 3) #Warning beeps
   {
      system('echo "\a"');
   }
   
   sleep(1);
   
}

system('clear');		#Final alarm, sounds alarmy.
print("00:00:00\n");
print("\rOVER !!!\n");

system('echo "\a"');
system('echo "\a"');
system('echo "\a"');

sleep(1);

system('echo "\a"');
system('echo "\a"');
system('echo "\a"');