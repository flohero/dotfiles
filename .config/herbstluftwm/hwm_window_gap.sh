echo $1
KIND=window_gap
NEW_GAP=5
if [ "$1" = "frame" ]
then
  KIND=frame_gap
  NEW_GAP=15
fi;
GAP=`herbstclient get $KIND`
if [ $GAP -eq 0 ] 
then
  herbstclient set $KIND $NEW_GAP
else 
  herbstclient set $KIND 0
fi;
