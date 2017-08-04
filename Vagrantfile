# -*- mode: ruby -*-
# vi: set ft=ruby :

PUPPET = '/opt/puppetlabs/bin/puppet'
MODULEPATH = '/vagrant/puppet/site:/vagrant/puppet/modules'

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", type: "dhcp"

  # We only need the synced folder on the master
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Bootstrap: install puppet agent on all hosts
  config.vm.provision "install agent", type: "shell", inline: <<-SHELL
    if [ ! -x #{PUPPET} ] ; then
      rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
      yum install -y puppet-agent avahi
    fi

    #{PUPPET} apply --modulepath #{MODULEPATH} \
      -e 'include ::profile::base::bootstrap'
    true # puppet returns non-zero if it makes a change
  SHELL

  # First run of puppet.
  run_agent_sh = <<-SHELL
    #{PUPPET} agent --test
    true # puppet returns non-zero if it makes a change
  SHELL
  config.vm.provision "run agent", type: "shell", inline: run_agent_sh

  config.vm.define "puppet-master" do |vm|
    vm.vm.hostname = "puppet-master.local"
    vm.vm.synced_folder ".", "/vagrant"

    vm.vm.provision "install master", type: "shell", inline: <<-SHELL
      #{PUPPET} apply --modulepath #{MODULEPATH} \
        -e 'include ::profile::puppetserver::bootstrap'
      # This will fail, but it's necessary to get puppetdb to start. WTF?!
      systemctl start puppetserver
      # Same deal. More WTF.
      #{PUPPET} agent --test

      #{PUPPET} apply --modulepath #{MODULEPATH} \
        -e 'include ::profile::puppetserver::bootstrap2'
      true # puppet returns non-zero if it makes a change
    SHELL

    # First run of puppet. This is specified a second time (see above) to
    # ensure that it runs *after* the puppetserver is installed.
    vm.vm.provision "run agent", type: "shell", inline: run_agent_sh
  end

  config.vm.define "web1" do |vm|
    vm.vm.hostname = "web1-prod.local"
  end

  config.vm.define "db1" do |vm|
    vm.vm.hostname = "db1-prod.local"
  end
end
