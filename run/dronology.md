# Run Dronology

Dronolgoy consists of 3 different parts: the (1) Dronology-Core, (2) the Dronology-UI, and (3) the Dronology GCS


## Dronology-Core
    
In a terminal, run Dronology:

    cd /path/to/Dronology/edu.nd.dronology.services.launch
    mvn exec:java
    
    
This runs until you stop it with Ctrl + C. 


	
## Dronology-UI

The Dronology-UI requires a servlet container (Tomcat, Jetty...) to run the Vaadin user interface

1. In a terminal, run the Vaadin UI:
    ```bash
    cd /path/to/Dronology/edu.nd.dronology.ui.vaadin
    mvn jetty:run
    ```
    This starts a web server that you will connect to in a later step. This runs until you stop it with Ctrl + C.



1. Open your browser and navigate to the Dronology web UI at [http://localhost:8080/vaadinui](http://localhost:8080/vaadinui).




## Dronology GCS

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
cd ~/git/Dronology-GCS/multi_comm/src
python main_ui.py
```

### Configuring Simulations
For now, you configure the vehicles (drones) for a simulation using a JSON configuration file. Some sample configuration files are located in _~/git/Dronology-GCS/multi_comm/cfg/drone_cfgs_ e.g., _default.json_:
```json
[
  {
    "rtk_enabled": "false" ,
    "vehicle_id" : "VIRT1",
    "comm_modules": {
      "dronekit": {
        "ardupath": "/home/uav/git/ardupilot",
        "home": [41.714775, -86.238825],
        "vehicle_type": "VRTL"
      }
    }
 }
]
```
Each JSON entry corresponds to a single drone. For simulations, the only necessary fields are "vehicle_type" (VRTL) and "home" (the starting latitude and longitude of the drone). 

Before running a simulation, you must also modify the ardupath specified in _~/git/Dronology-GCS/multi_comm/cfg/global_cfg.json_:

```json
{
  "ardupath": "/home/uav/git/ardupilot"
}
```

This should point to your cloned copy of ArduPilot.
