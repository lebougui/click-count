
clickount.deploy.script:
  file.managed:
    - name: /srv/salt/clickcount/sources/deploy.sh
    - source: salt://clickcount/deploy.skel
    - template: jinja

tomcat7:
  pkg:
    - installed

openjdk-8-jdk:
  pkg:
    - installed

clickcount.deploy:
  cmd.run:
    - name: |
          chmod +x deploy.sh
          ./deploy.sh

    - cwd:  /srv/salt/clickcount/sources

