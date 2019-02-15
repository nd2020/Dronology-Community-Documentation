
#! /bin/bash
################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################
# Clone the Dronology Repository
# modify these two pointers if you want to change where the repos should be cloned
# defaults to $HOME/git (e.g., /home/bayley/git)
# will fail and/or result in unexpected behavior if parent directory does not exist or is not an absolute path!
export REPOS_PARENT_DIR=$HOME
export REPOS_DIR=git
export DRONOLOGY_REPO_URL=https://github.com/SAREC-Lab/Dronology-Community-Core.git

export DRONOLOGY_REPO_NAME=Dronology
export DRONOLOGY_BRANCH=2019_02

################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################

echo "Using $DRONOLOGY_REPO_URL - branch: $BRANCH from $DRONOLOGY_BRANCH" 

#install maven
export CURR_VER=`lsb_release -rs`
if [ "${CURR_VER/.}" -lt "1604" ]
then
    sudo add-apt-repository --yes ppa:openjdk-r/ppa
fi
sudo apt-get update
sudo apt install --yes openjdk-8-jdk maven

# makes the directory if it doesn't already exist
mkdir -p "$REPOS_PARENT_DIR/$REPOS_DIR"
cd "$REPOS_PARENT_DIR/$REPOS_DIR"

git clone -b $DRONOLOGY_BRANCH --single-branch  $DRONOLOGY_REPO_URL $DRONOLOGY_REPO_NAM
cd $DRONOLOGY_REPO_NAME
git checkout $DRONOLOGY_BRANCH
cd ..
