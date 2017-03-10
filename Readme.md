docker project for symfony
make chnges for ip address in docker-compose.yml
also you can add aditional software to Dockerfile

Folders
    Project
	place source code here (symfony project)
	also for usability plase composer phar (optionality)
    bash
	Additional scripts for container automation
	by default fiile places on /var/www (in virtual machine)
	on project it stores in 'bash' folder
    db
	folder  for docker file - for conaner db
	also stored as volume database data
    php
	php config for main container
    apache
	apache config for main container

