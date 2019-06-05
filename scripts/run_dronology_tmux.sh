#!/bin/sh 
session="dronology"
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '


################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################
REPO="$HOME/git/2019_Summer_Dronology-Core"
server=edu.nd.dronology.services.launch
vaadin=edu.nd.dronology.ui.vaadin
GCS="$HOME/git/2019_Summer_Dronology-GCS/multi_comm/src"
################################### ################################# ################################




#pkill -9 java
#pkill -9 python

tmux kill-session -t $session
tmux new-session -d -s $session

tmux selectp -t 0
tmux splitw -h -p 20 # split it into two halves
tmux selectp -t 0
tmux splitw -v -p 30
tmux selectp -t 1
tmux splitw -v -p 30



tmux selectp -t 1
tmux send-keys "cd $REPO/$server;mvn exec:java" C-m
tmux selectp -t 3
tmux send-keys "cd $REPO/$vaadin;mvn jetty:run" C-m 
tmux selectp -t 2
tmux send-keys "cd $GCS;python main_ui.py" C-m 
tmux selectp -t 4
tmux send-keys "cd $REPO" C-m 

#tmux send-keys "cd /win/Work/git" C-m 

# Select pane 1
tmux selectp -t 1
#tmux select-window -t $session:0
tmux attach-session -t $session
