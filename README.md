
Get salt pillars

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

Build and install click-count web app in staging mode and validate.
If tests are successfull install click-count web app in production mode.
Otherwise abort the installation.

```
# sudo salt-call --local  state.apply -l debug 

                 Apache Maven 3.1.1 (0728685237757ffbf44136acec0402957f723d9a; 2013-09-17 17:22:22+0200)
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
                  [INFO] Webapp assembled in [1260 msecs]
                  [INFO] Building war: /srv/salt/clickcount/sources/target/clickCount.war
                  [INFO] WEB-INF/web.xml already added, skipping
                  [INFO] ------------------------------------------------------------------------
                  [INFO] BUILD SUCCESS
                  [INFO] ------------------------------------------------------------------------
                  [INFO] Total time: 5.293s
                  [INFO] Finished at: Mon Jun 26 15:06:49 CEST 2017
                  [INFO] Final Memory: 17M/173M
                  [INFO] ------------------------------------------------------------------------
                  Requirement already satisfied: virtualenv in /usr/local/lib/python2.7/dist-packages
                  New python executable in /srv/salt/clickcount/sources/tests/venv/bin/python
                  Installing setuptools, pip, wheel...done.
                  Requirement already satisfied: pytest in ./venv/lib/python2.7/site-packages (from -r requirements.txt (line 1))
                  Requirement already satisfied: requests in ./venv/lib/python2.7/site-packages (from -r requirements.txt (line 2))
                  Requirement already satisfied: logging in ./venv/lib/python2.7/site-packages (from -r requirements.txt (line 3))
                  Requirement already satisfied: setuptools in ./venv/lib/python2.7/site-packages (from pytest->-r requirements.txt (line 1))
                  Requirement already satisfied: py>=1.4.33 in ./venv/lib/python2.7/site-packages (from pytest->-r requirements.txt (line 1))
                  Requirement already satisfied: idna<2.6,>=2.5 in ./venv/lib/python2.7/site-packages (from requests->-r requirements.txt (line 2))
                  Requirement already satisfied: urllib3<1.22,>=1.21.1 in ./venv/lib/python2.7/site-packages (from requests->-r requirements.txt (line 2))
                  Requirement already satisfied: chardet<3.1.0,>=3.0.2 in ./venv/lib/python2.7/site-packages (from requests->-r requirements.txt (line 2))
                  Requirement already satisfied: certifi>=2017.4.17 in ./venv/lib/python2.7/site-packages (from requests->-r requirements.txt (line 2))
                  ============================= test session starts ==============================
                  platform linux2 -- Python 2.7.12, pytest-3.1.2, py-1.4.34, pluggy-0.4.0 -- /srv/salt/clickcount/sources/tests/venv/bin/python
                  cachedir: .cache
                  rootdir: /srv/salt/clickcount/sources/tests, inifile:
                  collecting ... collected 2 items
                  
                  test_deployment.py::TestClickCount::test_healthcheck PASSED
                  test_deployment.py::TestClickCount::test_new_click PASSED
                  
                  =========================== 2 passed in 0.71 seconds ===========================
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
                  [INFO] Webapp assembled in [301 msecs]
                  [INFO] Building war: /srv/salt/clickcount/sources/target/clickCount.war
                  [INFO] WEB-INF/web.xml already added, skipping
                  [INFO] ------------------------------------------------------------------------
                  [INFO] BUILD SUCCESS
                  [INFO] ------------------------------------------------------------------------
                  [INFO] Total time: 4.634s
                  [INFO] Finished at: Mon Jun 26 15:07:04 CEST 2017
                  [INFO] Final Memory: 17M/168M
                  [INFO] ------------------------------------------------------------------------

Summary for local
------------
Succeeded: 4 (changed=1)
Failed:    0
------------
Total states run:     4
Total run time:  22.706 s


```

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


