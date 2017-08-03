# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.network "private_network", type: "dhcp"

  # We only need the synced folder on the master
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Bootstrap: install puppet agent on all hosts
  config.vm.provision "install agent", type: "shell", inline: <<-SHELL
    if [ ! -x /opt/puppetlabs/bin/puppet ] ; then
      rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
      yum install -y puppet-agent avahi
      /opt/puppetlabs/bin/puppet config set --section main \
        server puppet-master.local
    fi
  SHELL

  # First run of puppet.
  run_agent_sh = <<-SHELL
    /opt/puppetlabs/bin/puppet agent --test
    true # puppet returns non-zero if it makes a change
  SHELL
  config.vm.provision "run agent", type: "shell", inline: run_agent_sh

  config.vm.define "puppet-master" do |vm|
    vm.vm.hostname = "puppet-master.local"
    vm.vm.synced_folder ".", "/vagrant"

    vm.vm.provision "install master", type: "shell", inline: <<-SHELL
      puppet apply --modulepath /vagrant/puppet/site:/vagrant/puppet/modules \
        -e 'include ::profile::puppetserver::bootstrap'
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
