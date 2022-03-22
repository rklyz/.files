file=$(date +%C-%m-%d_%T).png
loc=$HOME/Pictures/
dunstify "Screenshot in 3 seconds..." -t 2000 -r "333"
maim -u -d 3 | tee $loc$file | xclip -selection clipboard -t image/png
dunstify -i $loc$file "Screenshot Taken.." -t 5000 -r "333"
