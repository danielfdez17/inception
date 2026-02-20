***As this project needs to be done on a VM, i configured a FTP server in the VM to upload the project from the host OS***
- [Set up FTP server on a VM](https://medium.com/@tpriyanshu/how-to-create-an-ftp-server-on-a-linux-virtual-machine-hosted-on-cloud-4f4eace5c8a5)
- Important: enable write_access to upload the project
- Steps:
1. Once VM has been powered up, run 'ip a' to know the IP address of the VM
2. Follow the guide until the write_access is enabled
VM Network adaptation
3. In the host machine, the project to be uploaded needs to be compressed with the command 'tar -czvf <folder_name>.zip <desired_folder>'
4. From the host machine, connect to the VM's FTP server (ftp <VM username>@<VM IP address>). Enter your password to access the VM, and you will be in.
5. To upload files run put <desired_file>. If you encounter any problem with passive mode, just run the command 'passive' and this mode will change
6. In the VM check if the folder has been transferred properly
7. Uncompress the file running the command 'tar xf <folder_name>.zip

# How to set up the environment from scratch.
## Prerequisites

## Configuration files ⚠

:blush:
<i class="fab fa-github"></i>
:x:
:100:
## Secrets

# How to build and launch the project (Makefile + Docker Compose)

# Relevant commands to deal with containers and volumes

# Where the project data is stored and how it persist


