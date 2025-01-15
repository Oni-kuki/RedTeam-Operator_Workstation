Vagrant.configure("2") do |config|
    config.vm.define "RTOW-Vbox" do |config|
    config.vm.box = "RedTeam-Operator_Workstation/RedTeamWkstn-virtualbox"
    #config.vm.box_url = "https://api.cloud.hashicorp.com/vagrant-archivist/v1/object/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJSZWRUZWFtLU9wZXJhdG9yX1dvcmtzdGF0aW9uL1JlZFRlYW1Xa3N0bi12aXJ0dWFsYm94LzEvdmlydHVhbGJveC82MmJhYjVkYi1kMzMyLTExZWYtYjMzYy0wMjg1MWU2NmU1NWUiLCJtb2RlIjoiciIsImZpbGVuYW1lIjoiUmVkVGVhbVdrc3RuLXZpcnR1YWxib3hfMV92aXJ0dWFsYm94X2FtZDY0LmJveCJ9.T7UZH8hZFz2hyBmWmU4t9cHx12RSMiN4CBgHvzTCWt0"
    config.vm.box_download_checksum_type = "sha256"
    config.vm.box_download_checksum = "A72DA2DA90473C51B16A7B5B99A003A553C381A0664054E960ED9728EC1FDBB0"
    config.vm.box_version = "1"
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
        v.customize ["modifyvm", :id, "--memory", 8192]
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
    #config.vm.box_url = "https://api.cloud.hashicorp.com/vagrant-archivist/v1/object/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJrZXkiOiJSZWRUZWFtLU9wZXJhdG9yX1dvcmtzdGF0aW9uL1JlZFRlYW1Xa3N0bi12bXdhcmUvMS92bXdhcmVfZGVza3RvcC9lYTc1Y2U5OC1kMzMwLTExZWYtYjMzYy0wMjg1MWU2NmU1NWUiLCJtb2RlIjoiciIsImZpbGVuYW1lIjoiUmVkVGVhbVdrc3RuLXZtd2FyZV8xX3Ztd2FyZV9kZXNrdG9wX2FtZDY0LmJveCJ9.I6CFTAzusBel8YkB4MY2leryxKMsJfJ_DPt-BQ8sSj8"
    config.vm.box_download_checksum_type = "sha256"
    config.vm.box_download_checksum = "B8777D5720DA50DAAF0022A2293582F04D83A01183878BA0D5D45FBBB23531EC"
    config.vm.box_version = "1"
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
