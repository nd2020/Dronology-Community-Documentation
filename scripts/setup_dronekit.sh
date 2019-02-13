#! /bin/bash
################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################
# Clone the Ardupilot Repository
# modify these two pointers if you want to change where the repos should be cloned
# defaults to $HOME/git (e.g., /home/bayley/git)
# will fail and/or result in unexpected behavior if parent directory does not exist or is not an absolute path!
export REPOS_PARENT_DIR=$HOME
export REPOS_DIR=git
################################ MODIFY DRONOLOGY REPO PARAMETERS HERE ##############################

echo "Installing and Configuring Ardupilot"

# prereqs
export CURR_VER=`lsb_release -rs`
function version_ge() { test "$(echo "$@" | tr " " "\n" | sort -rV | head -n 1)" == "$1"; }


# install python
sudo apt-get install --yes software-properties-common
sudo add-apt-repository --yes ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install --yes python2.7
# install pip
sudo apt-get install --yes python-pip
# install git
sudo apt-get install --yes git

# makes the directory if it doesn't already exist
mkdir -p "$REPOS_PARENT_DIR/$REPOS_DIR"
cd "$REPOS_PARENT_DIR/$REPOS_DIR"

# Clone the ArduPilot repository.
git clone git://github.com/ArduPilot/ardupilot.git
cd ardupilot
git submodule update --init --recursive

# Install ardupilot dependencies
if version_ge $CURR_VER '16.0'; then
export WXGTK_VERSION=3.0
else
export WXGTK_VERSION=2.8
fi
echo "Linux Version is: $CURR_VER -- wxgtk $WXGTK_VERSION needs to be installed"
sudo apt-get  install --yes python-dev python-opencv python-wxgtk$WXGTK_VERSION python-pip python-matplotlib python-pygame python-lxml
sudo pip install future pymavlink MAVProxy

# Build SITL
export PATH=$PATH:$REPOS_PARENT_DIR/$REPOS_DIR/ardupilot/Tools/autotest
export PATH=/usr/lib/ccache:$PATH
cd ArduCopter
SIM_VEHICLE=`which sim_vehicle.py`

cat << EOF | python
import os, re, signal, subprocess, sys

def run_until_readline_match(pargs, workdir, pattern):
    PIPE = subprocess.PIPE
    process = subprocess.Popen(pargs, cwd=workdir, stdin=PIPE, stdout=PIPE, stderr=PIPE, close_fds=True, preexec_fn=os.setsid)
    outstream = process.stdout
    line = outstream.readline()
    sys.stdout.write(line)
    sys.stdout.flush()
    while not pattern.match(line):
        line = outstream.readline()
        sys.stdout.write(line)
        sys.stdout.flush()
    os.killpg(process.pid, signal.SIGTERM)

run_until_readline_match(
    ["$SIM_VEHICLE", '-w', '-j4'],
    "$PWD",
    re.compile("^'build' finished successfully \([^\)]*\)\s*\r?\n?$")
)
EOF

echo 'done'
