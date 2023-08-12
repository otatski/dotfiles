#!/usr/bin/env bash

# pictures_dir="$(xdg-user-dir PICTURES 2> /dev/null)"
slice="$HOME/dotfiles/slice.png"

image=$(mktemp --tmpdir --suffix=.png lock.XXXXXXXXXX)
trap 'rm -f "$image"' SIGINT SIGTERM EXIT

screens=$(xrandr | grep -Eo '[0-9]+x[0-9]+\+[0-9]+\+[0-9]+')
declare -a lines

# slice height
S=160

# line position (from center)
P=-300

for screen in $screens; do
    read -r W H X Y < <(sed 's/[^0-9]/ /g' <<< "$screen")
    lines+=(\( "$slice"
        -resize "${W}x${S}!"
        -geometry "+${X}+$((Y+H/2-P-S/2))" \)
        -composite -matte)
done

# maim -u -m 1 \
#     | convert png:- -scale 10% -scale 1000% \
maim -u -m 1 "$image" && convert "$image" -scale 10% -scale 1000% \
    -fill "#0f60d1" -colorize 10% \
    ${lines[*]} "$image"

i3lock \
    --color=0f60d1 \
    --image="$image" \
    --inside-color=0f60d1FF \
    --insidever-color=0f60d1FF \
    --insidewrong-color=0f60d1FF \
    --ring-color=0f60d1FF \
    --ringver-color=FABD2FFF \
    --ringwrong-color=FB4934FF \
    --separator-color=0f60d1FF \
    --line-color=EBDBB2FF \
    --keyhl-color=EBDBB2FF \
    --bshl-color=FB4934FF \
    --ring-width=4 \
    --radius=32 \
    --ind-pos="x+w/2:y+h/2-$P" \
    --time-color=A89984FF \
    --time-pos='ix-180:iy+12' \
    --time-pos='ix-r-50:iy+12' \
    --time-str='%H:%M:%S' \
    --time-font='monospace' \
    --time-align=2 \
    --time-size=32 \
    --date-color=A89984FF \
    --date-pos='ix+180:iy+12' \
    --date-pos='ix+r+50:iy+12' \
    --date-str='%d.%m.%y' \
    --date-font='monospace' \
    --date-align=1 \
    --date-size=32 \
    --greeter-pos='x+100:iy+12' \
    --verif-color=000000FF \
    --wrong-color=A85535FF \
    --modif-color=000000FF \
    --layout-color=000000FF \
    --greeter-color=A89984FF \
    --verif-text='' \
    --wrong-text='Aah, Aah, aah!' \
    --noinput-text='Input Password' \
    --lock-text='Screen Locked' \
    --lockfailed-text='' \
    --greeter-text='Mat' \
    --ignore-empty-password \
    --show-failed-attempts \
    --pass-media-keys \
    --pass-screen-keys \
    --indicator \
    --clock
