Clone the ArduPilot repository.
```bash
git clone git://github.com/ArduPilot/ardupilot.git
cd ardupilot
git submodule update --init --recursive
```

Install a few ArduPilot dependencies.
```bash
sudo apt-get install python-matplotlib python-serial python-wxgtk2.8 python-wxtools python-lxml
sudo pip install future pymavlink MAVProxy
```

---
**NOTE**
If you are running Ubuntu 16.04 or newer, replace  'python-wxgtk2.8' with  'python-wxgtk3.0' !

---


Temporarily add some directories to your search path (to make this permanent, add these lines to ~/.bashrc). _Note: if you did not clone ardpilot into ~/git you will need to modify the first line to point to the correct location._
```bash
export PATH=$PATH:$HOME/git/ardupilot/Tools/autotest
export PATH=/usr/lib/ccache:$PATH
```
Start a simulated vehicle to automatically build SITL. 
```bash
cd ArduCopter
sim_vehicle.py -w -j4
```
Once everything is built you can kill the process (ctrl+c).

Lastly, install all Groundstation dependencies.
```bash
cd ~/git/Dronology-GCS-Community/multi_comm
sudo pip install -r requirements.txt
```

