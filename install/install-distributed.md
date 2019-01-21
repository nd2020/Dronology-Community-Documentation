# Dronology Setup

By default Dronology is configured to run on a single machine (Dronology Core, Dronology GCS and Dronology UI)
Any of the above parts can run on a separte machine.

TODO: add architecture figure,

## Configuration

### Configure GCS

By default, the GCS connects to Dronology via a socket connection @localhost via port 1234.


```bash
cd ~/git/Dronology-GCS-Community/multi_comm/src
python main.py -gid mygid -addr localhost -p 1234 -d ../cfg/drone_cfgs/default.json -c ../cfg/global_cfg.json
```

By changing the -addr parameter a different location can be selected

* _addr_ the address that dronology is running on (default: localhost)
* _p_ the port that dornology is running on (default: 1234)


### Dronology UI

By default, the GCS Vaadin UI to Dronology via Java RMI @localhost via port 9779
This is configured in [edu.nd.dronology.ui.vaadin.start.MainUI](https://github.com/SAREC-Lab/Dronology-Community/blob/2018_10/edu.nd.dronology.ui.vaadin/src/main/java/edu/nd/dronology/ui/vaadin/start/MyUI.java)

```bash
provider.init("localhost", 9779);
```
	
