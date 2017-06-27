# Click count


Click count pipeline.
We use salt tree states for pipeline automation.
Pipeline steps are described below :
- Build and install click-count web app in staging mode and validate.
  Validation is peformed using pytests script in a virtualenv.
  - If validation is successfull install click-count web app in production mode.
  - Otherwise abort the installation.

Pipeline validated on Ubuntu 16 and CentOS 7.

If an issue occurs during the pipeline exection you can validate steps using an ubuntu docker container.


Table of contents
=================

  * [1. Setup environment](#setup)
  * [2. CI/CD pipeline execution example](#pipeline)
  * [3. How to debug pipeline](#debug)


Setup
-----

Install salt utils

```
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sh bootstrap_salt.sh

```

We use salt in masterless mode. 
salt-minion daemon must be stopped if running.

```
# systemctl status salt-minion
● salt-minion.service - The Salt Minion
   Loaded: loaded (/lib/systemd/system/salt-minion.service; enabled; vendor pres
   Active: active (running) since Mon 2017-03-27 13:17:00 CEST; 3 months 0 days 
 Main PID: 913 (salt-minion)
 ...

# systemctl stop salt-minion

```

Pipeline 
--------
Please make sure salt is correctly installed first.
Copy this repo tree into salt base folder (default is /srv).

Get salt pillars to validate the environment :

```
#sudo salt-call --local pillar.items

local:
    ----------
    redis:
        ----------
        production:
            35.158.164.55
        staging:
            35.157.234.38
```

Then execute pipeline steps :
```
# sudo salt-call --local  state.apply -l debug 

local:
----------
          ID: clickount.deploy.script
    Function: file.managed
        Name: /srv/salt/clickcount/sources/deploy.sh
      Result: True
     Comment: File /srv/salt/clickcount/sources/deploy.sh is in the correct state
     Started: 09:54:32.933538
    Duration: 37.07 ms
     Changes:   
----------
          ID: openjdk-8-jdk
    Function: pkg.installed
      Result: True
     Comment: Package openjdk-8-jdk is already installed
     Started: 09:54:33.349009
    Duration: 1167.965 ms
     Changes:   
----------
          ID: tomcat7
    Function: pkg.installed
      Result: True
     Comment: Package tomcat7 is already installed
     Started: 09:54:34.517197
    Duration: 7.369 ms
     Changes:   
----------
          ID: tomcat7
    Function: service.running
      Result: True
     Comment: The service tomcat7 is already running
     Started: 09:54:34.525493
    Duration: 61.842 ms
     Changes:   
----------
          ID: python-pip
    Function: pkg.installed
      Result: True
     Comment: Package python-pip is already installed
     Started: 09:54:34.587709
    Duration: 8.121 ms
     Changes:   
----------
          ID: clickcount.deploy
    Function: cmd.run
        Name: chmod +x deploy.sh
./deploy.sh

      Result: True
     Comment: Command "chmod +x deploy.sh
              ./deploy.sh
              " run
     Started: 09:54:34.597234
    Duration: 20428.797 ms
     Changes:   
              ----------
              pid:
                  5512
              retcode:
                  0
              stderr:
              stdout:
                  Apache Maven 3.1.1 (0728685237757ffbf44136acec0402957f723d9a; 2013-09-17 15:22:22+0000)
                  Maven home: /etc/apache-maven-3.1.1
                  Java version: 1.8.0_131, vendor: Oracle Corporation
                  Java home: /usr/lib/jvm/java-8-openjdk-amd64/jre
                  Default locale: en_US, platform encoding: ANSI_X3.4-1968
                  OS name: "linux", version: "4.4.0-66-generic", arch: "amd64", family: "unix"
                  [INFO] Scanning for projects...
                  [INFO]                                                                         
                  [INFO] ------------------------------------------------------------------------
                  [INFO] Building clickCount 1.0-SNAPSHOT
                  [INFO] ------------------------------------------------------------------------
                  [INFO] 
                  [INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ clickCount ---
                  [INFO] Deleting /srv/salt/clickcount/sources/target
                  [INFO] 
                  [INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ clickCount ---
                  [INFO] Using 'UTF-8' encoding to copy filtered resources.
                  [INFO] Copying 2 resources
                  [INFO] 
                  [INFO] --- maven-compiler-plugin:2.5.1:compile (default-compile) @ clickCount ---
                  [INFO] Compiling 4 source files to /srv/salt/clickcount/sources/target/classes
                  [INFO] 
                  [INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ clickCount ---
                  [INFO] Using 'UTF-8' encoding to copy filtered resources.
                  [INFO] skip non existing resourceDirectory /srv/salt/clickcount/sources/src/test/resources
                  [INFO] 
                  [INFO] --- maven-compiler-plugin:2.5.1:testCompile (default-testCompile) @ clickCount ---
                  [INFO] No sources to compile
                  [INFO] 
                  [INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ clickCount ---
                  [INFO] No tests to run.
                  [INFO] 
                  [INFO] --- maven-war-plugin:2.2:war (default-war) @ clickCount ---
                  [INFO] Packaging webapp
                  [INFO] Assembling webapp [clickCount] in [/srv/salt/clickcount/sources/target/clickCount]
                  [INFO] Processing war project
                  [INFO] Copying webapp resources [/srv/salt/clickcount/sources/src/main/webapp]
                  [INFO] Webapp assembled in [71 msecs]
                  [INFO] Building war: /srv/salt/clickcount/sources/target/clickCount.war
                  [INFO] WEB-INF/web.xml already added, skipping
                  [INFO] ------------------------------------------------------------------------
                  [INFO] BUILD SUCCESS
                  [INFO] ------------------------------------------------------------------------
                  [INFO] Total time: 2.953s
                  [INFO] Finished at: Tue Jun 27 09:54:38 UTC 2017
                  [INFO] Final Memory: 17M/171M
                  [INFO] ------------------------------------------------------------------------
                  Requirement already up-to-date: pip in /usr/local/lib/python2.7/dist-packages
                  Requirement already up-to-date: virtualenv in /usr/local/lib/python2.7/dist-packages
                  New python executable in /srv/salt/clickcount/sources/tests/venv/bin/python
                  Installing setuptools, pip, wheel...done.
                  Collecting pytest (from -r requirements.txt (line 1))
                    Using cached pytest-3.1.2-py2.py3-none-any.whl
                  Collecting requests (from -r requirements.txt (line 2))
                    Using cached requests-2.18.1-py2.py3-none-any.whl
                  Collecting logging (from -r requirements.txt (line 3))
                  Requirement already satisfied: setuptools in ./venv/lib/python2.7/site-packages (from pytest->-r requirements.txt (line 1))
                  Collecting py>=1.4.33 (from pytest->-r requirements.txt (line 1))
                    Using cached py-1.4.34-py2.py3-none-any.whl
                  Collecting idna<2.6,>=2.5 (from requests->-r requirements.txt (line 2))
                    Using cached idna-2.5-py2.py3-none-any.whl
                  Collecting urllib3<1.22,>=1.21.1 (from requests->-r requirements.txt (line 2))
                    Using cached urllib3-1.21.1-py2.py3-none-any.whl
                  Collecting chardet<3.1.0,>=3.0.2 (from requests->-r requirements.txt (line 2))
                    Using cached chardet-3.0.4-py2.py3-none-any.whl
                  Collecting certifi>=2017.4.17 (from requests->-r requirements.txt (line 2))
                    Using cached certifi-2017.4.17-py2.py3-none-any.whl
                  Installing collected packages: py, pytest, idna, urllib3, chardet, certifi, requests, logging
                  Successfully installed certifi-2017.4.17 chardet-3.0.4 idna-2.5 logging-0.4.9.6 py-1.4.34 pytest-3.1.2 requests-2.18.1 urllib3-1.21.1
                  ============================= test session starts ==============================
                  platform linux2 -- Python 2.7.12, pytest-3.1.2, py-1.4.34, pluggy-0.4.0 -- /srv/salt/clickcount/sources/tests/venv/bin/python
                  cachedir: .cache
                  rootdir: /srv/salt/clickcount/sources/tests, inifile:
                  collecting ... collected 2 items
                  
                  test_deployment.py::TestClickCount::test_healthcheck PASSED
                  test_deployment.py::TestClickCount::test_new_click PASSED
                  
                  =========================== 2 passed in 0.89 seconds ===========================
                  /srv/salt/clickcount/sources
                  [INFO] Scanning for projects...
                  [INFO]                                                                         
                  [INFO] ------------------------------------------------------------------------
                  [INFO] Building clickCount 1.0-SNAPSHOT
                  [INFO] ------------------------------------------------------------------------
                  [INFO] 
                  [INFO] --- maven-clean-plugin:2.5:clean (default-clean) @ clickCount ---
                  [INFO] Deleting /srv/salt/clickcount/sources/target
                  [INFO] 
                  [INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ clickCount ---
                  [INFO] Using 'UTF-8' encoding to copy filtered resources.
                  [INFO] Copying 2 resources
                  [INFO] 
                  [INFO] --- maven-compiler-plugin:2.5.1:compile (default-compile) @ clickCount ---
                  [INFO] Compiling 4 source files to /srv/salt/clickcount/sources/target/classes
                  [INFO] 
                  [INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ clickCount ---
                  [INFO] Using 'UTF-8' encoding to copy filtered resources.
                  [INFO] skip non existing resourceDirectory /srv/salt/clickcount/sources/src/test/resources
                  [INFO] 
                  [INFO] --- maven-compiler-plugin:2.5.1:testCompile (default-testCompile) @ clickCount ---
                  [INFO] No sources to compile
                  [INFO] 
                  [INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ clickCount ---
                  [INFO] No tests to run.
                  [INFO] 
                  [INFO] --- maven-war-plugin:2.2:war (default-war) @ clickCount ---
                  [INFO] Packaging webapp
                  [INFO] Assembling webapp [clickCount] in [/srv/salt/clickcount/sources/target/clickCount]
                  [INFO] Processing war project
                  [INFO] Copying webapp resources [/srv/salt/clickcount/sources/src/main/webapp]
                  [INFO] Webapp assembled in [99 msecs]
                  [INFO] Building war: /srv/salt/clickcount/sources/target/clickCount.war
                  [INFO] WEB-INF/web.xml already added, skipping
                  [INFO] ------------------------------------------------------------------------
                  [INFO] BUILD SUCCESS
                  [INFO] ------------------------------------------------------------------------
                  [INFO] Total time: 3.027s
                  [INFO] Finished at: Tue Jun 27 09:54:54 UTC 2017
                  [INFO] Final Memory: 17M/174M
                  [INFO] ------------------------------------------------------------------------

Summary for local
------------
Succeeded: 6 (changed=1)
Failed:    0
------------
Total states run:     6
Total run time:  21.711 s



```

Debug
-----

When validation tests fail pytests will dump logs for debug purpose.

```

=========================================================================================== test session starts ============================================================================================
platform linux2 -- Python 2.7.12, pytest-3.0.6, py-1.4.32, pluggy-0.4.0 -- /usr/bin/python
cachedir: .cache
rootdir: /srv/salt/clickcount/sources/tests, inifile: 
collected 2 items 

test_deployment.py::TestClickCount::test_healthcheck FAILED
test_deployment.py::TestClickCount::test_new_click FAILED

================================================================================================= FAILURES =================================================================================================
______________________________________________________________________________________ TestClickCount.test_healthcheck ______________________________________________________________________________________

self = <test_deployment.TestClickCount instance at 0x7f26d3a20248>

    @pytest.mark.tryfirst
    def test_healthcheck(self):
        """
            Checks healthcheck API
    
            Successful if :
            - HTTP response is 200
            - 'ok' is found in the response body
            """
        url = self.clickcount_base_url + "/healthcheck"
        http_response = requests.get(url)
        self.log("REQUEST : " + url)
>       assert http_response.status_code == 200
E       assert 404 == 200
E        +  where 404 = <Response [404]>.status_code

test_deployment.py:52: AssertionError
------------------------------------------------------------------------------------------- Captured stdout call -------------------------------------------------------------------------------------------
INFO : REQUEST : http://localhost:8080/clickCount/rest/healthcheck
_______________________________________________________________________________________ TestClickCount.test_new_click _______________________________________________________________________________________

self = <test_deployment.TestClickCount instance at 0x7f26d39dfd40>

    def test_new_click(self):
        """
            Sends request to click rest API
            Get the current click count new_value
            Post a new one.
    
            Successful if :
            - HTTP response is 200
            - An integer is found in the response body
            """
        url = self.clickcount_base_url + "/click"
        http_response = requests.get(url)
        self.log("GET REQUEST : " + url)
>       assert http_response.status_code == 200
E       assert 404 == 200
E        +  where 404 = <Response [404]>.status_code

test_deployment.py:69: AssertionError
------------------------------------------------------------------------------------------- Captured stdout call -------------------------------------------------------------------------------------------
INFO : GET REQUEST : http://localhost:8080/clickCount/rest/click
========================================================================================= 2 failed in 0.12 seconds =========================================================================================

```


In order to debug the pipeline steps and tools installation you can use a docker container.
docker must be installed and running.

```
# docker build -t click_count:ubuntu -f Dockerfile.ubuntu .

# docker run --privileged --rm -it click_count:ubuntu salt-call --local  state.apply -l debug

```
