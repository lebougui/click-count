
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

Build and install click-count web app in staging mode

```
# sudo salt-call --local  state.apply -l debug pillar='{"mode" : "staging"}'
local:
----------
          ID: clickount.deploy.script
    Function: file.managed
        Name: /srv/salt/clickcount/click-count/deploy.sh
      Result: True
     Comment: File /srv/salt/clickcount/click-count/deploy.sh updated
     Started: 18:41:07.340665
    Duration: 18.264 ms
     Changes:   
              ----------
              diff:
                  --- 
                  +++ 
                  @@ -13,7 +13,7 @@
                   props=$(find src -name "*.properties")
                   
                   
                  -   sed -i 's|redis.host=.*|redis.host='35.158.164.55'|g' $props
                  +   sed -i 's|redis.host=.*|redis.host='35.157.234.38'|g' $props
                   
                   
                   mvn clean package
----------
          ID: tomcat7
    Function: pkg.installed
      Result: True
     Comment: Package tomcat7 is already installed
     Started: 18:41:07.934546
    Duration: 594.441 ms
     Changes:   
----------
          ID: openjdk-8-jdk
    Function: pkg.installed
      Result: True
     Comment: Package openjdk-8-jdk is already installed
     Started: 18:41:08.529193
    Duration: 5.539 ms
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
     Started: 18:41:08.535992
    Duration: 4089.165 ms
     Changes:   
              ----------
              pid:
                  24077
              retcode:
                  0
              stderr:
              stdout:
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
                  [INFO] Deleting /srv/salt/clickcount/click-count/target
                  [INFO] 
                  [INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ clickCount ---
                  [INFO] Using 'UTF-8' encoding to copy filtered resources.
                  [INFO] Copying 2 resources
                  [INFO] 
                  [INFO] --- maven-compiler-plugin:2.5.1:compile (default-compile) @ clickCount ---
                  [INFO] Compiling 4 source files to /srv/salt/clickcount/click-count/target/classes
                  [INFO] 
                  [INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ clickCount ---
                  [INFO] Using 'UTF-8' encoding to copy filtered resources.
                  [INFO] skip non existing resourceDirectory /srv/salt/clickcount/click-count/src/test/resources
                  [INFO] 
                  [INFO] --- maven-compiler-plugin:2.5.1:testCompile (default-testCompile) @ clickCount ---
                  [INFO] No sources to compile
                  [INFO] 
                  [INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ clickCount ---
                  [INFO] No tests to run.
                  [INFO] 
                  [INFO] --- maven-war-plugin:2.2:war (default-war) @ clickCount ---
                  [INFO] Packaging webapp
                  [INFO] Assembling webapp [clickCount] in [/srv/salt/clickcount/click-count/target/clickCount]
                  [INFO] Processing war project
                  [INFO] Copying webapp resources [/srv/salt/clickcount/click-count/src/main/webapp]
                  [INFO] Webapp assembled in [75 msecs]
                  [INFO] Building war: /srv/salt/clickcount/click-count/target/clickCount.war
                  [INFO] WEB-INF/web.xml already added, skipping
                  [INFO] ------------------------------------------------------------------------
                  [INFO] BUILD SUCCESS
                  [INFO] ------------------------------------------------------------------------
                  [INFO] Total time: 2.703s
                  [INFO] Finished at: Fri Jun 23 18:41:12 CEST 2017
                  [INFO] Final Memory: 17M/174M
                  [INFO] ------------------------------------------------------------------------

Summary for local
------------
Succeeded: 4 (changed=2)
Failed:    0
------------
Total states run:     4
Total run time:   4.707 s
```

Test click-count web app

```
#curl http://localhost:8080/clickCount/rest/click
22


#curl http://localhost:8080/clickCount/rest/healthcheck
ok


#curl -X POST  http://localhost:8080/clickCount/rest/click
23

#curl http://localhost:8080/clickCount/rest/click
23

```

If tests are successfull install click-count web app in production mode

```
# sudo salt-call --local  state.apply -l debug pillar='{"mode" : "production"}'
local:
----------
          ID: clickount.deploy.script
    Function: file.managed
        Name: /srv/salt/clickcount/click-count/deploy.sh
      Result: True
     Comment: File /srv/salt/clickcount/click-count/deploy.sh updated
     Started: 18:42:26.407486
    Duration: 19.46 ms
     Changes:   
              ----------
              diff:
                  --- 
                  +++ 
                  @@ -13,7 +13,7 @@
                   props=$(find src -name "*.properties")
                   
                   
                  -   sed -i 's|redis.host=.*|redis.host='35.157.234.38'|g' $props
                  +   sed -i 's|redis.host=.*|redis.host='35.158.164.55'|g' $props
                   
                   
                   mvn clean package
----------
          ID: tomcat7
    Function: pkg.installed
      Result: True
     Comment: Package tomcat7 is already installed
     Started: 18:42:27.130740
    Duration: 576.854 ms
     Changes:   
----------
          ID: openjdk-8-jdk
    Function: pkg.installed
      Result: True
     Comment: Package openjdk-8-jdk is already installed
     Started: 18:42:27.707796
    Duration: 5.684 ms
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
     Started: 18:42:27.714721
    Duration: 4226.513 ms
     Changes:   
              ----------
              pid:
                  24230
              retcode:
                  0
              stderr:
              stdout:
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
                  [INFO] Deleting /srv/salt/clickcount/click-count/target
                  [INFO] 
                  [INFO] --- maven-resources-plugin:2.6:resources (default-resources) @ clickCount ---
                  [INFO] Using 'UTF-8' encoding to copy filtered resources.
                  [INFO] Copying 2 resources
                  [INFO] 
                  [INFO] --- maven-compiler-plugin:2.5.1:compile (default-compile) @ clickCount ---
                  [INFO] Compiling 4 source files to /srv/salt/clickcount/click-count/target/classes
                  [INFO] 
                  [INFO] --- maven-resources-plugin:2.6:testResources (default-testResources) @ clickCount ---
                  [INFO] Using 'UTF-8' encoding to copy filtered resources.
                  [INFO] skip non existing resourceDirectory /srv/salt/clickcount/click-count/src/test/resources
                  [INFO] 
                  [INFO] --- maven-compiler-plugin:2.5.1:testCompile (default-testCompile) @ clickCount ---
                  [INFO] No sources to compile
                  [INFO] 
                  [INFO] --- maven-surefire-plugin:2.12.4:test (default-test) @ clickCount ---
                  [INFO] No tests to run.
                  [INFO] 
                  [INFO] --- maven-war-plugin:2.2:war (default-war) @ clickCount ---
                  [INFO] Packaging webapp
                  [INFO] Assembling webapp [clickCount] in [/srv/salt/clickcount/click-count/target/clickCount]
                  [INFO] Processing war project
                  [INFO] Copying webapp resources [/srv/salt/clickcount/click-count/src/main/webapp]
                  [INFO] Webapp assembled in [79 msecs]
                  [INFO] Building war: /srv/salt/clickcount/click-count/target/clickCount.war
                  [INFO] WEB-INF/web.xml already added, skipping
                  [INFO] ------------------------------------------------------------------------
                  [INFO] BUILD SUCCESS
                  [INFO] ------------------------------------------------------------------------
                  [INFO] Total time: 2.849s
                  [INFO] Finished at: Fri Jun 23 18:42:31 CEST 2017
                  [INFO] Final Memory: 19M/258M
                  [INFO] ------------------------------------------------------------------------

Summary for local
------------
Succeeded: 4 (changed=2)
Failed:    0
------------
Total states run:     4
Total run time:   4.829 s

```

Test click-count in production mode

```
#curl http://localhost:8080/clickCount/rest/click
0


#curl http://localhost:8080/clickCount/rest/healthcheck
ok


#curl -X POST  http://localhost:8080/clickCount/rest/click
1

#curl http://localhost:8080/clickCount/rest/click
1
```


