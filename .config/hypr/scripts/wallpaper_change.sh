wallpaperDir=~/Documents/Pictures/wallpapers/
monitor=($(hyprctl monitors | grep Monitor | awk '{print $2}'))
wal=$(find ${wallpaperDir} -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
cache=""

while true; do
	if [[ $cache == $wal ]]; then
		wal=$(find ${wallpaperDir} -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
	else
		cache=$wal
		hyprctl hyprpaper unload all
		hyprctl hyprpaper preload $wal
		if [[ $wal = *contain-* ]]; then
			contain=contain:
		else
			contain=""
		fi
		for m in ''${monitor[@]}; do
			hyprctl hyprpaper wallpaper "${m},${contain}${wal}"
		done
	fi
  # Change wallpaper every 2 hours
	sleep 7200
done
