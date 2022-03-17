file=$(date +%C-%m-%d_%T).png
loc=$HOME/Screenshot/
notify-send "Screenshot in 3 seconds..." -t 2000
maim -u -d 3 | tee $loc$file | xclip -selection clipboard -t image/png
notify-send -i $loc$file "Screenshot Taken.."
