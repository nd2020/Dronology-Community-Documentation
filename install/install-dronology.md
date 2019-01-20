# Dronology Installation

## Getting Started

The following directions explain how to setup your computer as a development machine. By the end you should be able to build, test, run, and modify the project.

1. Install a [JDK 8+](http://www.oracle.com/technetwork/java/javase/downloads/index.html) and [Maven](https://maven.apache.org). Make sure the JDK's bin directory is in your `PATH`. On some platforms, like Windows, you also need to make sure that the `JAVA_HOME` environment variable is set up and pointing to the directory where the JDK is installed. On Windows, you also need to add the JDK's bin directory to your `PATH` variable. Make sure that Maven's bin directory is in your `PATH` too. On Ubuntu you can quickly install a JDK and Maven with:
	```bash
	sudo add-apt-repository ppa:openjdk-r/ppa
	sudo apt-get update
	sudo apt install openjdk-8-jdk maven
	```
	On Ubuntu, using the above command, you don't need to setup environment variables.

1. Clone the project:
   ```bash
   git clone git@github.com:SAREC-Lab/[Dronology|Dronology-Community].git Dronology
   ```

1. Build, test, package, and install the project in your local Maven repository:
    ```bash
    cd /path/to/Dronology
    mvn install
    ````
    
    




1. To install and setup the GroundStation and the SITL Simulator continue [here](https://github.com/SAREC-Lab/Dronology-documentation/new/master/install/install-GCS.md)


## Tips and Troubleshooting
* If you plan to work with the source code, consider installing an IDE. Popular IDEs like [Eclipse](https://www.eclipse.org), [Netbeans](https://netbeans.org/downloads/) and [IntelliJ](https://www.jetbrains.com/idea/) all work well with maven projects like this one.

* Sometimes it's necessary to run the project even if tests are failing. To force the Maven install command use:
    ```bash
    mvn install -Dmaven.test.skip=true
    ```

* If your local maven repository gets messed up, you can force maven to re-download dependencies, rebuild everything and install:
    ```bash
    cd /path/to/Dronology
    mvn clean
    cd ~/.m2/repository
    rm -rf *
    cd /path/to/Dronology
    mvn install
    ```
