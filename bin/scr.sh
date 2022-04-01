file=$(date +%C-%m-%d_%T).png
loc=$HOME/Pictures/
dunstify "Screenshot in 3 seconds..." -t 1000 -r "333"
sleep 1
dunstify "Screenshot in 2 seconds..." -t 1000 -r "333"
sleep 1
dunstify "Screenshot in 1 seconds..." -t 1000 -r "333"
maim -u -d 3| tee $loc$file | xclip -selection clipboard -t image/png
dunstify -i $loc$file "Screenshot Taken.." -t 5000 -r "333"
