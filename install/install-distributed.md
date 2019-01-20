# Dronology Setup

By default Dronology is configured to run on a single machine (Dronology Core, Dronology GCS and Dronology UI)
Any of the above parts can run on a separte machine.

TODO: add architecture figure,

## Configuration

### Configure GCS

By default, the GCS connects to Dronology @localhost via port 1234.


```bash
cd ~/git/Dronology-GCS-Community/multi_comm/src
python main.py -gid mygid -addr localhost -p 1234 -d ../cfg/drone_cfgs/default.json -c ../cfg/global_cfg.json
```

By changing the -addr parameter a different location can be selected

* _addr_ the address that dronology is running on (default: localhost)
* _p_ the port that dornology is running on (default: 1234)

