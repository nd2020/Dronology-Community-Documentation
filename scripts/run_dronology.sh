#! /bin/bash
#cd "$(dirname "$(realpath "$0")")"
################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################
REPO="$HOME/git/Dronology-Core"
server=edu.nd.dronology.services.launch
vaadin=edu.nd.dronology.ui.vaadin
################################

pkill -9 java
#$cd $RPEO; exec mvn install"

gnome-terminal --working-directory=$REPO/$server -x bash -c "mvn exec:java"
gnome-terminal --working-directory=$REPO/$vaadin -x bash -c "mvn jetty:run"
sleep 15
xdg-open 'http://localhost:8080/vaadinui'
