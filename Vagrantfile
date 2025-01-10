Vagrant.configure("2") do |config|
    config.vm.define "RTOW-Vbox" do |config|
    config.vm.box = "RedTeam-Operator_Workstation/RedTeamWkstn-virtualbox"
    config.vm.box_url = "https://api.cloud.hashicorp.com/vagrant-archivist/v1/object/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJSZWRUZWFtLU9wZXJhdG9yX1dvcmtzdGF0aW9uL1JlZFRlYW1Xa3N0bi12aXJ0dWFsYm94LzEvVmlydHVhbGJveC9jMWI2M2JiZS1jMWE3LTExZWYtOTRjMC03NmNhOTZiY2YzNTEiLCJtb2RlIjoiciIsImZpbGVuYW1lIjoiUmVkVGVhbVdrc3RuLXZpcnR1YWxib3hfMV92aXJ0dWFsYm94X2FtZDY0LmJveCJ9._L4xXa95qPtpNVhW0MAIQD11m3B3OQ8sS5x62_TreZA"
   # config.vm.box_version = "1"
    config.vm.communicator = "winrm"

    # Admin user name and password
    config.winrm.username = "vagrant"
    config.winrm.password = "vagrant"

    config.vm.guest = :windows
    config.windows.halt_timeout = 15

    # if you want to use RDP to connect to the VM you can use the following line
    #config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true

    config.vm.provider :virtualbox do |v, override|
        #v.gui = true
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
        v.customize ["modifyvm", :id, "--vram", 128]
        v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        v.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
    end
    end
end

Vagrant.configure("2") do |config|
    config.vm.define "RTOW-Vmware" do |config|
    config.vm.box = "RedTeam-Operator_Workstation/RedTeamWkstn-vmware"
    config.vm.box_url = "https://api.cloud.hashicorp.com/vagrant-archivist/v1/object/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJSZWRUZWFtLU9wZXJhdG9yX1dvcmtzdGF0aW9uL1JlZFRlYW1Xa3N0bi12bXdhcmUvMS9WTXdhcmUvMjBhYThjNzAtYzFhMC0xMWVmLThjYWYtNzZjYTk2YmNmMzUxIiwibW9kZSI6InIiLCJmaWxlbmFtZSI6IlJlZFRlYW1Xa3N0bi12bXdhcmVfMV92bXdhcmVfZGVza3RvcF9hbWQ2NC5ib3gifQ.UCrrBva9jDNYhK0Upm2pXzY0pzfkXQLG9YOkCuCghQU"
   # config.vm.box_version = "1"
    config.vm.communicator = "winrm"

    # Admin user name and password
    config.winrm.username = "vagrant"
    config.winrm.password = "vagrant"

    config.vm.guest = :windows
    config.windows.halt_timeout = 15

    # if you want to use RDP to connect to the VM you can use the following line
    #config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true

    config.vm.provider :vmware_desktop do |v, override|
        v.gui = true
        v.vmx["memsize"] = "2048"
        v.vmx["numvcpus"] = "2"
        v.vmx["ethernet0.virtualDev"] = "vmxnet3"
        v.vmx["RemoteDisplay.vnc.enabled"] = "false"
        v.vmx["RemoteDisplay.vnc.port"] = "5900"
        v.vmx["scsi0.virtualDev"] = "lsisas1068"
        v.enable_vmrun_ip_lookup = false
        v.whitelist_verified = true
        v.vmx["hgfs.linkRootShare"] = "FALSE"
    end
end
end
