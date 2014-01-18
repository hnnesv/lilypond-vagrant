# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.network :bridged

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "manifests"
     puppet.manifest_file  = "lily.pp"
  end
end
