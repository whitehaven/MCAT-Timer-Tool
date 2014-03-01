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
   
   printf("\r%02d:%02d:%02d",
      ($end_time - $time) / (60*60),
      ($end_time - $time) / (   60) % 60,
      ($end_time - $time)           % 60,
   );
   if ($end_time - $time <= 5)
   {
      system('echo "\a"');
   }
   sleep(1);
}

print("\rOVER !!!\n");

system('echo "\a"');
system('echo "\a"');
system('echo "\a"');

sleep(1);

system('echo "\a"');
system('echo "\a"');
system('echo "\a"');