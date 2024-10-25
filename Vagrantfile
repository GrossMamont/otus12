# -*- mode: ruby -*-
# vim: set ft=ruby :

MACHINES = {
  :Systemd => {
        :box_name => "ubuntu/jammy64",
        :vm_name => "v20241002.0.0",
        :net => [
           ["192.168.56.150",  2, "255.255.255.0", "intnet"],
        ]
  }
}

Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|

    config.vm.define boxname do |box|
   
      box.vm.box = boxconfig[:box_name]
      box.vm.host_name = boxconfig[:vm_name]
      
      box.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 4
       end

      boxconfig[:net].each do |ipconf|
        box.vm.network("private_network", ip: ipconf[0], adapter: ipconf[1], netmask: ipconf[2])
      end

      box.vm.provision "shell", inline: <<-SHELL
        mkdir -p ~root/.ssh
        cp ~vagrant/.ssh/auth* ~root/.ssh
        sudo sed -i 's/\#PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
        systemctl restart sshd
      SHELL
     
      box.vm.provision "shell", path: "./step1.sh"
      box.vm.provision "shell", path: "./step2.sh"
      box.vm.provision "shell", path: "./step3.sh"
    end
  end
end