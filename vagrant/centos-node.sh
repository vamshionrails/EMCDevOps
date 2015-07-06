!/bin/sh

# Run on VM to bootstrap Puppet Agent nodes

if ps aux | grep "puppet agent" | grep -v grep 2> /dev/null
then
    echo "Puppet Agent is already installed. Moving on..."
else
    curl -k https://192.168.1.114:8140/packages/current/install.bash
    sudo yum install nano
fi


if cat /etc/crontab | grep puppet 2> /dev/null
then
echo "Puppet Agent is already configured. Exiting..."
else

sudo puppet resource cron puppet-agent ensure=present user=root minute=30 \
command='/usr/bin/puppet agent --onetime --no-daemonize --splay'

sudo puppet resource service puppet ensure=running enable=true

# Configure /etc/hosts file
echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "# Host config for Puppet Master and Agent Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.1.114   puppet.vamshi.com  puppet" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.1.10   puppetagent.vamshi.com  node01" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.1.20   puppetagent1.vamshi.com  node02" | sudo tee --append /etc/hosts 2> /dev/null

# Add agent section to /etc/puppet/puppet.conf
echo "" && echo "[agent]\nserver=puppet" | sudo tee --append /etc/puppetlabs/puppet.conf 2> /dev/null

sudo puppet agent --enable
fi