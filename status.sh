#/bin/sh

#DATE
DATECMD=`date +"%A %e %B  %H:%M"`
DATESEP="$SEPCOL"
DATE="$DATECMD"

#MEM
#MEMTOT=`statgrab -M mem.total | egrep -o "([0-9]+)"`
#MEMUSED=`statgrab -M mem.used | egrep -o "([0-9]+)"`
#MEMPC=`echo $MEMTOT $MEMUSED | awk '{printf "%d", ($2/$1)*100'}`

#CPU
#CPUFREE=`statgrab -sopt1 -f1 cpu.idle | egrep -o "([0-9]+)"`
#CPUPC=`echo 100 $CPUFREE | awk '{printf "%d", ($1-$2)'}`

#Volume
VOL=`amixer | grep "Master" -A 5 | grep -o "\[.*%" | sed "s/\[//"`

#MUSIC
MUSICCUR="`mpc | head -1` "

# Check if mpd is stopped (erase $MUSIC)
mpc current | grep ".*" > /dev/null 2>&1
if [ $? -eq 1 ]; then
MUSICCUR=""
fi

#Battery
CAPACITY=`cat /proc/acpi/battery/BAT0/info | grep "last\ full\ capacity" | cut -d" " -f9`
CURRENT=`cat /proc/acpi/battery/BAT0/state | grep "remaining" | cut -d" " -f8`
BATPC=`echo $CAPACITY $CURRENT | awk '{printf "%d", ($2/$1)*100'}`
BAT="Batterie $BATPC%"
if [ $BATPC = "168" ]
then
	BAT="Batterie pleine"
fi

STATE=`cat /proc/acpi/battery/BAT0/info | grep present | awk '{print $2}'`
if [ $STATE = "no" ]
then
	BAT=""
fi

#Affichage
#wmfs -s "\\#19C206\\ $MUSICCUR\\#CC00DE\\$BATPC \\#0081DE\\ Volume $VOL \\#FF0000\\  CPU $CPUPC%   Mémoire $MEMPC%  \\#FF9203\\ $DATE"

wmfs -s "\\#19C206\\ $MUSICCUR \\#CC00DE\\$BAT \\#0081DE\\ Volume $VOL \\#FF0000\\ $DATE"
