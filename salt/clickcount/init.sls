
openjdk-8:
  pkg.installed :
  {% if grains['os_family'] == 'Debian' %}
    - name : openjdk-8-jdk
  {% elif grains['os_family'] == 'RedHat' %}
    - name : java-1.8.0-openjdk
  {% endif %}


tomcat:
  pkg.installed :
  {% if grains['os_family'] == 'Debian' %}
    - name : tomcat7
  {% elif grains['os_family'] == 'RedHat' %}
    - name : tomcat
  {% endif %}
  
  service.running:
  {% if grains['os_family'] == 'Debian' %}
    - name : tomcat7
  {% elif grains['os_family'] == 'RedHat' %}
    - name : tomcat
  {% endif %}


python-pip:
  pkg.installed :
  {% if grains['os_family'] == 'Debian' %}
    - name : python-pip
  {% elif grains['os_family'] == 'RedHat' %}
    - name : python2-pip
  {% endif %}


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

