
#! /bin/bash
################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################
# Clone the Dronology Repository
# modify these two pointers if you want to change where the repos should be cloned
# defaults to $HOME/git (e.g., /home/bayley/git)
# will fail and/or result in unexpected behavior if parent directory does not exist or is not an absolute path!
export REPOS_PARENT_DIR=$HOME
export REPOS_DIR=git
export DRONOLOGY_REPO_URL=https://github.com/SAREC-Lab/Dronology.git


export DRONOLOGY_REPO_NAME=Dronology-Community
export DRONOLOGY_BRANCH=master

################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################

echo "Using $DRONOLOGY_REPO_NAME - branch: $BRANCH from $DRONOLOGY_BRANCH" 


#install maven
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt install openjdk-8-jdk maven


cd $REPOS_PARENT_DIR
# makes the directory if it doesn't already exist
mkdir $REPOS_DIR
cd $REPOS_DIR


git clone $DRONOLOGY_REPO_URL
cd $DRONOLOGY_REPO_NAME
git checkout $DRONOLOGY_BRANCH
cd ..
