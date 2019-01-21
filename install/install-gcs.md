# Dronology Groundstation Installation

If dronekit, SITL, and ardupilot is not installed, plese follow [this](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/install/install-dronekitsitl.md) instructions first.


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

Clone the Dronology Groundstation repository.
```bash
cd ~
mkdir git
cd git
git clone https://github.com/SAREC-Lab/[Dronology-GCS|Dronology-GCS-Community].git Dronology-GCS
```

Lastly, install all Groundstation dependencies.
```bash
cd ~/git/Dronology-GCS/multi_comm
sudo pip install -r requirements.txt
```


