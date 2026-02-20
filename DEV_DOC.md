# How to set up the environment from scratch.
## Prerequisites
- Virtual Box (7.0.18r162988).
- ISO image of the latest version of [Lubuntu](https://cdimage.ubuntu.com/lubuntu/releases/noble/release/) (currently using lubuntu-24.04.4-desktop-amd64).

### For the following dependencies visit this [repo](https://github.com/danielfdez17/scripts/blob/main/inception/install.sh) to install them
- Docker
- Docker compose
- make

## Configuration files
To set up the project structure visit this [repo](https://github.com/danielfdez17/scripts/blob/main/inception/inception.sh)

## Secrets
To set up the environmental variables for the project visit this [repo](https://github.com/danielfdez17/scripts/blob/main/inception/scripts/env.sh)


# How to build and launch the project (Makefile + Docker Compose)
The project will be compiled and executed by running
```bash
cd inception && make all
```

# Relevant commands to deal with containers and volumes
To stop the docker containers, execute
```bash
make down
```
To know which images have been built and which docker containers are running, execute
```bash
make st
```
To stop the containers and remove the images run
```bash
make clean
```
To rebuild the project execute
```bash
make re
```

# Where the project data is stored and how it persist
The project data will be stored in the home of the user (danfern3 in this case) in the folder
```bash
/home/danfern3/data
```
# Important :a::l::e::r::t:
***As this project needs to be done on a VM, i decided to configure a FTP server in the VM to upload the project from the host OS***
- [Set up FTP server on a VM](https://medium.com/@tpriyanshu/how-to-create-an-ftp-server-on-a-linux-virtual-machine-hosted-on-cloud-4f4eace5c8a5)
- Important: enable write_access to upload the project
- Steps :warning: VM Network adaptation :warning:


1. Once VM has been powered up, run 'ip a' to know the IP address of the VM
2. Follow the guide until the write_access is enabled
3. In the host machine, the project to be uploaded needs to be compressed with the command 'tar -czvf <folder_name>.zip <desired_folder>'
4. From the host machine, connect to the VM's FTP server (ftp <VM username>@<VM IP address>). Enter your password to access the VM, and you will be in.
5. To upload files run put <desired_file>. If you encounter any problem with passive mode, just run the command 'passive' and this mode will change
6. In the VM check if the folder has been transferred properly
7. Uncompress the file running the command 'tar xf <folder_name>.zip
