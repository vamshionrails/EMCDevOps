# README

#Git Reset
git fetch origin master
git reset --hard origin/master

#Master
 service pe-puppetserver restart; service pe-console-services restart ; service pe-httpd restart
 sudo puppet master --verbose --no-daemonize
puppet config print modulepath --section master --environment development

puppet apply --modulepath modules/ -e 'class {"hello_world":}'

# Test
puppet apply --modulepath modules/ -e 'class {"hellotest":}'

#Agent
curl -k https://linux.vamshi.com:8140/packages/current/install.bash | sudo bash
