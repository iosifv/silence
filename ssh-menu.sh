#!/bin/bash

# Original code from = https://bash.cyberciti.biz/guide/A_menu_box
# utilitymenu.sh - A sample shell script to display menus on screen
# Store menu options selected by the user
INPUT=/tmp/menu.sh.$$

# Storage file for displaying cal and date command output
OUTPUT=/tmp/output.sh.$$

# trap and delete temp files
trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

#
# Purpose - display output using msgbox 
#  $1 -> set msgbox height
#  $2 -> set msgbox width
#  $3 -> set msgbox title
#
function display_output(){
	local h=${1-16}			# box height default 10
	local w=${2-48} 		# box width default 41
	local t=${3-Output} 	# box title 
	dialog --backtitle "Silence - a simple SSH manager" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}

#
# Purpose - display current status of system
#
function show_ssh(){
	echo "SSH files on system in ~/.ssh\n" >$OUTPUT
	echo "=============================\n" >>$OUTPUT
	ls -lis ~/.ssh >>$OUTPUT
	echo "\n\n\nCurrent Encrypted files:\n" >>$OUTPUT
	echo "============================\n" >>$OUTPUT
	ls -l | grep ssh-vault.tar >>$OUTPUT
	echo "\n\n\nCurrent Decrypted folder:\n" >>$OUTPUT
	echo "=============================\n" >>$OUTPUT
	ls -d */ | grep ssh-vault >>$OUTPUT
    display_output 24 60 "Current Status"
}

#
# Purpose - Run the separate files
#
function run_backup(){
	sh ./ssh/backup.sh >$OUTPUT
	display_output 13 60 "Backup"
}
function run_unpack(){
	sh ./ssh/unpack.sh >$OUTPUT
	display_output 13 60 "Unpack"
}
function run_overwrite(){
	sh ./ssh/overwrite.sh >$OUTPUT
	display_output 13 60 "Overwrite"
}

#
# set infinite loop
#
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Silence - a simple SSH manager" \
--title "[ M A I N - M E N U ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 16 60 6 \
Info "Show current status" \
Backup "Create an encrypted backup of ~/.ssh" \
Unpack "Decrypt backup to ./ssh-vault" \
Overwrite "Overwrite ~/.ssh with decrypted backup" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decsion 
case $menuitem in
	Info) show_ssh;;
	Backup) run_backup;;
	Unpack) run_unpack;;
	Overwrite) run_overwrite;;
	Exit) echo "Bye"; break;;
esac

done

# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT
