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

### Configuring Simulations
For now, you configure the vehicles (drones) for a simulation using a JSON configuration file. Some sample configuration files are located in _~/git/Dronology-GCS-Community/multi_comm/cfg/drone_cfgs_ e.g., _default.json_:
```json
[
  {
    "rtk_enabled": "false" ,
    "vehicle_id" : "VIRT1",
    "comm_modules": {
      "dronekit": {
        "ardupath": "/home/bayley/git/ardupilot",
        "home": [41.714775, -86.238825],
        "vehicle_type": "VRTL"
      }
    }
 }
]
```
Each JSON entry corresponds to a single drone. For simulations, the only necessary fields are "vehicle_type" (VRTL) and "home" (the starting latitude and longitude of the drone). 

Before running a simulation, you must also modify the ardupath specified in _~/git/Dronology-GCS-Community/multi_comm/cfg/global_cfg.json_:

```json
{
  "ardupath": "/home/bayley/git/ardupilot"
}
```

This should point to your cloned copy of ArduPilot.
