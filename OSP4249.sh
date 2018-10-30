#!/bin/sh
#Setting  reminder

#command line arguments
text=$1		#this is for printing the required message on the reminder
countdown=$2	#this is for setting reminder time (in sec)
printf "\033[2J\033[H" #clearing terminal using ANSI escape sequence
if [ "$1" == "" ] || [ "$2" == "" ]		#checking weather user entered comand line arguments
then
        countdown=30 	#if not entered then we are using our default values for the remainder message and time
        text="You have started reminder, what have you forgotten?"
        echo ""
        printf "\033[1;32m"
fi
echo ""
echo "$text..."
echo "Timer=$countdown seconds..."
echo ""
echo "Press Ctrl-C in this window to stop..."
echo ""
> /tmp/reminder.sh	#file will be created if not present 
chmod 755 /tmp/reminder.sh		#giving permissions 
echo "#!/bin/sh" >> /tmp/reminder.sh
echo "printf '\033[1m\033[12;3f$text\033[0m\n\n\n'" >> /tmp/reminder.sh	#adding the remainder text 
echo "sleep 3" >> /tmp/reminder.sh #remainder window will remain for 3 sec
echo "exit 0" >> /tmp/reminder.sh	#after 3 sec we will close that window
while true		#this repeats for every remainder time u entered 
do
        xterm -e /tmp/reminder.sh &	#executing this operation until we kill the process
        sleep $countdown	#once remainder shown and if user didnt kill the process then again after countdown sec it will show remainder again
done



