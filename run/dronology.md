# Run Dronology

Dronolgoy consists of 2 different parts: the (1) Dronology-Core and (2) the Dronology-UI.


## Dronology-Core
    
In a terminal, run Dronology:
    ```bash
    cd /path/to/Dronology/edu.nd.dronology.services.launch
    mvn exec:java
    ```
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
