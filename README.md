# RedTeam-Operator_Workstation  

Based on this Project Overview : https://github.com/StefanScherer/packer-windows  
 
## Overview  
This project automates the setup of work environments for Red Team operators, enabling faster deployment and operational readiness.  

At the root of the `C:` drive, you will find a comprehensive set of tools necessary for conducting Red Team missions while adhering to OPSEC best practices.  

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

## Future Improvements  
- A future release will include full WSL configuration across both VMware and VirtualBox environments.
- For the moment I've only built and pushed w10 machines on the registry, but I'll be pushing w11 very soon.  

> [!TIP]
> **Tea Time !**  
> The template json for packer is available for several other virtualization methods, but I only have push on the registry for vmware and virtualbox, however you can build them yourself with the packer commands (but hang on, it takes time); but it allows you to be the master of your own boxes, and once it's built, you can use it whatever you like.

> [!NOTE]
> without them nothing would be possible! Thanks to all those who have created these tools  
> You can find their repositories in this script (the list is too long i couldn't put it here like this) :  [Respects on their names](https://github.com/Oni-kuki/RedTeam-Operator_Workstation/blob/main/AutoInstallwin/install.ps1)  
