#! /bin/bash
#cd "$(dirname "$(realpath "$0")")"
################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################
REPO="$HOME/git/Dronology-GCS"
################################

pkill -9 python

cd $REPO/multi_comm/src
python main_ui.py
