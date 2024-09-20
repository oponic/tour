#!/bin/bash
sudo -i
echo "Your terminal is $(tty)."
echo "If this is not a /dev/tty*, please exit and run the program in a TTY."
echo "Preferably tty3."
echo "Press any key to continue.."
read
cd /usr/local/tourcore/
exec ./innit
