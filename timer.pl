use strict;
use warnings;

my $hours=0;
my $minutes=40;
my $seconds=0;
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

   sleep(1);
}

print("\rKABOOM!!!!\n");

system('echo -e "\a"');
