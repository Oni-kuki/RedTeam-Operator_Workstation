# RedTeam-Operator Workstation  
<p align="center">
  <img src="./image/RedTeam.jpg" alt="Red" />
</p>  

Based on this Project Overview : https://github.com/StefanScherer/packer-windows  
 
## Overview  
> [!NOTE]  
> It's a simple project, nothing complicated, but if it helps, that's fine for me.  This is the most important

This project automates the setup of work environments for Red Team operators, enabling faster deployment and operational readiness.  
At the root of the `C:` drive, you will find a comprehensive set of tools necessary for conducting Red Team missions while adhering to OPSEC best practices.  

### Why :interrobang: <img src="./image/why.gif" align="right" width="290" height="190" />  
So why Windows? Well, it's not exactly out of enthusiasm. However, Visual Studio works well—really well, in fact—and it allows you to test loaders or payloads you might write. More importantly, it lets you have a minimal machine that closely resembles your engagement scope (client machine). I don't want to run two virtual machines—one Linux and one Windows—for everything. Needless to say, I won't necessarily use this machine for standard pentests.  



## Features  
- **Automated Visual Studio Installation**  
  - Pre-installed with `.NET`, `C`, and `C++` libraries.  
  - Some projects are precompiled, but operators can recompile them as needed to customize tools and maintain flexibility.  

- **Windows Subsystem for Linux (WSL)**  
  - Installed on both machines.  
  - Facilitates the use of Linux-based tools directly within Windows environments (to avoid having 40 machines for 2 systems).   
  - compilers and tools are available in both windows and linux environments to interact with each other and facilitate obfuscation, evasion and tool configuration.

## Virtualization Notes  

### VMware  
- **Nested virtualization** is fully supported with **WSL 2**.
- A Kali machine is pre-downloaded.   

### VirtualBox  
- **Nested virtualization** does not function reliably.  
- WSL 1 is used as an alternative.  
- Only the base Ubuntu machine is operational in this environment.  
- Ubuntu is pre-installed, but some tools might not be available immediately. The provided script can assist in configuring and downloading necessary tools.  

## Packer  
- If you want to create your own vagrant boxes using the Packers tool, you'll need to install packer and the plugins associated with the provider you want to use.  
- For packer you can use chocolatey packages, winget or directly on site, and yes vagrant are necessary to.  

Virtualbox  
```packer
packer plugins install github.com/hashicorp/virtualbox
```
Vmware  
```packer
packer plugins install github.com/hashicorp/vmware
```
## Building  
```
packer build --only=virtualbox-iso .\windows_10.json 
packer build --only=vmware-iso .\windows_10.json 
```
> [!CAUTION]
> I put 8gb of ram by default so, if you want more or less change the `attribut` memory at last of `windows_10.json`file.
> it may take some time, you can grab coffe or tea while you wait  :coffee:

## launching  :rocket:  
### Vagrant  
Most Interesting part for the easiest way to use.  
Even if it seems to be easy, there are prerequisites for some providers.  
For VMware you may need additional plugins for vagrant  
https://developer.hashicorp.com/vagrant/install/vmware   
```
vagrant plugin install vagrant-vmware-desktop
```
> [!CAUTION]
> I put 2gb of ram by default so, if you want more or less change the reference attributs in the `Vagrantfile` it's same thing for the cpus.  
> it may take some time the first time because it's necessary to download the box once, you can grab coffe or tea while you wait  :coffee:

> [!CAUTION]
> The Port `3389` can be opened for RDP if you work with VPS, remote acces machine or something like that.  
> (With "Security" of course, :expressionless: I don't think I should have to specify this, but I'm doing it anyway)  

### After that  
Clone this repo or take just the `Vagrantfile`  
VirtualBox Provider
```
vagrant up RTOW-Vbox --provider=virtualbox
```

VMware Provider
```
vagrant up RTOW-Vmware --provider=vmware_workstation
```

## Future Improvements  
- A future release will include full WSL configuration across both VMware and VirtualBox environments.
- For the moment I've only built and pushed w10 machines on the registry, but I'll be pushing w11 very soon.  

> [!TIP]
> **Tea Time !**  
> The template json for packer is available for several other virtualization methods, but I only have push on the registry for vmware and virtualbox, however you can build them yourself with the packer commands (but hang on, it takes time); but it allows you to be the master of your own boxes, and once it's built, you can use it whatever you like.

> [!NOTE]
> without them nothing would be possible! Thanks to all those who have created these tools  
> You can find their repositories in this script (the list is too long i couldn't put it here like this) :  [Respects on their names](https://github.com/Oni-kuki/RedTeam-Operator_Workstation/blob/main/AutoInstallwin/install.ps1)  
