# Dronology Documentation


## Installation

Setting up and Installing Dronology requires 3 different parts to be installed: 

* [Python, Dronekit and SITL](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/install/install-dronekitsitl.md)
are requried to run the Groundcontrol Station and simulate Virtual UAVs using the [Ardupilot](http://ardupilot.org/dev/docs/sitl-simulator-software-in-the-loop.html) Software-in-the-Loop SITL simulator

* The [Dronology Groundstation - GCS (Python)](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/install/install-gcs.md)

* The [Dronology Core (Java)](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/install/install-dronology.md)


### Scripts: 

We provide shell scripts for installing Dronekit and SITL [setup_dronekit.sh](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/scripts/setup_dronekit.sh), installing the 
Dronology-GCS [setup_dronology_GCS.sh](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/scripts/setup_dronology-GCS.sh), and installing the
Dronology Core [setup_dronology_core.sh](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/scripts/setup_dronology-core.sh) in Linux (tested in Ubuntu 16 and 18)


## Deployment Configurations
Per default Dronology is configured to run on a single machine. If either the Dronology UI and/or the Dronology GCS are supposed to run on a different machine please follow these instructions: [Distributed Setup](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/install/install-distributed.md)


## Run

[Run Dronology](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/run/dronology.md)

1. Run ```run_dronology.sh``` and ```run_dronology-GCS_ui.sh```  or ```scripts/run_dronology_tmux.sh``` in the scripts folder to start Dronology.

### Scripts: 

We provide scripts for running Dronogy [shell script](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/scripts/run_dronology.sh) which only runs Dronology or [tmux script](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/scripts/run_dronology_tmux.sh)  which runs both Dronology and the Groundstation UI  (requires tmux 2.6 or higher) and the 
Dronology Groundstation [GCS-UI shell script](scripts/run_dronology-GCS_ui.sh), [GCS Runner shell script](http://)




## Installation Methods

There are three ways to install Dronology.

* The [Quick Installation Guide](#quick-installation-guide) is well suited for those who want convenience and don't mind the defaults.
* The [Custom Installation Guide](#custom-installation-guide) is appropriate for people who want to specify some of the installation details while leveraging our scripts to automate much of the procedure.
* The [Manual Installation Guide](#manual-installation-guide) is best for those who want to dig into the details as it walks you through every step so you can see exactly what's going on.

> Note: the quick and custom methods use setup scripts that automate the manual installation instructions.

### Quick Installation Guide

The following command installs everything you need:

```bash
curl -o- https://raw.githubusercontent.com/SAREC-Lab/Dronology-Community-Documentation/auto-cfg-gcs/scripts/setup_all.sh | bash
```
Once it completes, you're ready to run Dronology.

> Note this method uses default settings. You can find Dronology and the rest in `$HOME/git`.


### Custom Installation Guide

This method lets you customize:

* Where Ardupilot gets installed.
* Where the ground control station gets installed, as well as the repo that gets cloned and the branch that gets checked out.
* Where dronology-core gets installed as well as the repo that gets cloned and the branch that gets checked out.

To install Dronology with these customizations:

1. Clone this repository
1. Modify the variables at the begining of `setup_dronekit.sh`, `setup_dronology-GCS.sh`, and `setup_dronology-core.sh` in the scripts folder. Here is what the variables mean:

    ___
    **Before running the install scripts please make sure that you change the variables accordingly!**

    ___

    * REPOS_DIR: the (relative) local directoy the repository will be cloned to (default: git).
    * REPOS_PARENT_DIR: the parent folder of the git directoy the repository will be cloned to (default: $HOME, i.e., /home/username).
    * REPO_URL The URL of the github repo (usually does not need to be changed).
    * REPO_NAME The name of the repository
    * BRANCH: The branch to use.
    * ARDUPILOT_DIR The local directory where you installed ardupilot
1. Run ```setup_dronekit.sh``` in the scripts folder
1. Run ```setup_dronology-GCS.sh``` in the scripts folder
1. Run ```setup_dronology-core.sh``` in the scripts folder
1. Run ```mvn clean```  in the Dronology folder (i.e., the location where you cloned Dronology)
1. Run ```mvn install``` in the Dronology folder

You're now ready to run Dronology.


### Manual Installation Guide

1. Set up [Python, Dronekit and SITL](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/install/install-dronekitsitl.md).
1. Set up the [Dronology Groundstation - GCS (Python)](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/install/install-gcs.md)
1. Set up [Dronology Core (Java)](https://github.com/SAREC-Lab/Dronology-documentation/blob/master/install/install-dronology.md)

## Misc

### Docker Container
comming soon..

### VM Image

We provide a fully configured VMWare and VirtualBox image.
Dronology and GCS code can be found in the /home/uav/git folder.
To start Dronology execute the run-dronology.sh shell script on the Desktop.

Please contact us for further information on the VM Image and the download link.





