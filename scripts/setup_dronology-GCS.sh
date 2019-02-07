#! /bin/bash
################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################
# Clone the Dronology Repository
# modify these two pointers if you want to change where the repos should be cloned
# defaults to $HOME/git (e.g., /home/bayley/git)
# will fail and/or result in unexpected behavior if parent directory does not exist or is not an absolute path!
export REPOS_PARENT_DIR=$HOME
export REPOS_DIR=git
export REPO_URL=https://github.com/SAREC-Lab/Dronology-Community-GCS.git
export REPO_NAME=Dronology-GCS
export BRANCH=integration
################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################

echo "Using $REPO_NAME - branch: $BRANCH from $REPO_URL" 

# prereqs
export CURR_VER=`lsb_release -rs`
function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }

# install python
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python2.7
# install pip
sudo apt-get install python-pip
# install git
sudo apt-get install git
sudo apt-get install python-qt4

cd $REPOS_PARENT_DIR
# makes the directory if it doesn't already exist
mkdir $REPOS_DIR
cd $REPOS_DIR
git clone $REPO_URL $REPO_NAME
cd $REPO_NAME
git checkout $BRANCH
cd ..

# Install groundstation dependencies
sudo pip install -r $REPOS_PARENT_DIR/$REPOS_DIR/$REPO_NAME/multi_comm/requirements.txt

if version_ge $CURR_VER '16.0'; then
export WXGTK_VERSION=3.0
else
export WXGTK_VERSION=2.8
fi

echo "Linux Version is: $CURR_VER -- wxgtk $WXGTK_VERSION needs to be installed"
sudo apt-get install python-dev python-opencv python-wxgtk$WXGTK_VERSION python-pip python-matplotlib python-pygame python-lxml
sudo pip install future pymavlink MAVProxy
