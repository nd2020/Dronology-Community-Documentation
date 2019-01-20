# Dronology Groundstation Setup

These instructions have been tested using Ubuntu 14.04 and Ubuntu 16.04.

### Installation Instructions

The GCS can either be installed manually or via the setup script (setup_gcs.sh).  
For manual installation follow the steps described in the readme.  
When using the setup script, update the path variables before running the script to enusre that the GCS and ardupilot are installed at the right location.


### Prerequisites

Ensure you have Python 2.7 installed.

```
python -V
```

You should expect to see "Python 2.7.x" If you don't, [download and install](https://www.python.org/download/releases/2.7/) a copy.

Now make sure [pip](https://pypi.python.org/pypi/pip) is installed. 
```bash
sudo apt-get update
sudo apt-get install python-pip
```

If you plan on using the GCS UI install the UI libraries.
```bash
sudo apt-get install python-qt4

```
Lastly, make sure [git](https://git-scm.com/) is installed. 
```bash
sudo apt-get install git
```

### Setup

Clone the Dronology repository.
```bash
cd ~
mkdir git
cd git
git clone https://github.com/SAREC-Lab/Dronology-GCS-Community.git
```



### Running
Once you've [setup and started Dronology](https://github.com/SAREC-Lab/Dronology-Community/blob/2018_10/README.md), you can start the groundstation.

```bash
cd ~/git/Dronology-GCS-Community/multi_comm/src
python main.py -gid mygid -addr localhost -p 1234 -d ../cfg/drone_cfgs/default.json -c ../cfg/global_cfg.json
```
All command line arguments have default values. 

* _gid_ the groundstation id (default: default_ground_station)
* _addr_ the address that dronology is running on (default: localhost)
* _p_ the port that dornology is running on (default: 1234)
* _d_ the path to the drone configuration file (default: ../cfg/drone_cfgs/default.json)
* _c_ the path to the global configuration file (default: ../cfg/global_cfg.json)

You can also use the GCS UI: 
```bash
cd ~/git/Dronology-GCS-Community/multi_comm/src
python main_ui.py
```
