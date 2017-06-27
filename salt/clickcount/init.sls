
openjdk-8:
  pkg.installed :
    - name : openjdk-8-jdk
    

tomcat:
  pkg.installed :
    - name : tomcat7
  service.running:
    - name : tomcat7
  

python-pip:
  pkg.installed :
    - name : python-pip


clickount.deploy.script:
  file.managed:
    - name: /srv/salt/clickcount/sources/deploy.sh
    - source: salt://clickcount/deploy.skel
    - template: jinja


clickcount.deploy:
  cmd.run:
    - name: |
          chmod +x deploy.sh
          ./deploy.sh

    - cwd:  /srv/salt/clickcount/sources
    - require : 
      - file : clickount.deploy.script

