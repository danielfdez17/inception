*This project has been created as part of the 42 curriculum by danfern3*

# Description (present the project, including its goal and a brief overview)
This projects aims to set up different services connected between each other to run on docker containers.

## Virtual Machines vs Docker
|Feature|Virtual Machine|Docker Container|
|:----|:-----------------:|:------------------:|
|Isolation|Provides complete isolation from the host OS and other VMs. This is useful when a strong security boundary is critical|Typically provides lightweight isolation from the host and other containers, but doesn't provide as strong a security boundary as a VM.|
|Operating System|Runs a complete OS including the kernel, thus requiring more system resources|Runs the user mode portion of an OS, and can be tailored to contain just the needed services for an app, using fewer system resources|
|Guest Compatibility|Runs about any OS inside the VM|Runs on the same OS version as the host|
|Deployment|Deploy individual VMs by using Windows Admin Center or Hyper-V Manager; deploy multiple VMs by using PowerShell or System Center Virtual Machine Manager|Deploy individual containers by using Docker via command ine; deploy multiple containers by using an orchestrator such as Azure Kubernetes Service|
|Persistent storage|Use a virtual hard disk (VHD) for local storage for a single VM, or an SMB (Server Message Block) file share for storage shared by multiple users|Use Azure Disks for local storage for a single node, or Azure Files (SMB shares) for storage shared by multiple nodes or servers|
|Load Balancing|VM load balancing moves running VMs to other server in a failover cluster|Containers themselves don't move; instead an orchestrator can automatically start or stop containers on cluster nodes to manage changes in load and availability|
|Fault tolerance|VMs can fail over to another server in a cluster, with the MV's OS restarting on the new server|If a cluster node fails, any containers running on it are rapidly recreated by the orchestrator on another cluster node|
|Networking|Uses virtual network adapters|Uses an isolated view of a virtual network adapter, providing a little less virtualization (the host's firewall is shared with containers) while using less resources|

## Main OS Resources
- Whereas VMs run complete OS including the kernel and requiring more system resources, Docker containers run the user mode portion of an OS, and can be tailored to contain just the needed services for an app, using fewer system resources.

## Secrets vs Environment Variables
|Feature|Secrets|Environmental variables|
|:----|:-----------------:|:------------------:|
|Security|Environment variables are pretty convenient to use especially for storing sensitive information such as API Secret tokens, DB access keys etc but the main drawback of it is they can potentially be accessed and abused by anyone with access to the system and or through logging mechanisms|It provides a secure means to store secrets by encrypting them at rest and in transit. Along with that it provides other value added services like fine grained access control, auditing, rotation policy etc. enhancing overall security|
|Flexibility|They are typically straight forward to use. They can be used in applications without any additional setups to be done but the catch is they become nerve wrecking when you have to maintain large number of keys multiplied by different/multiple environments|Best thing about this is it offers more flexibility when it comes to managing secrets centrally. It allows you to store not just key-value pairs but as well complex data structures. It tops it up by providing APIs and SDKs for accessing secrets programmatically making integrations with your apps much easier|
|Management Capabilities|Environment variables might be quickest way to get started easily but managing them becomes tough as it often involves manual processes such as updating configurations on each system individually which might result in inconsistencies and potential security risks if not handled properly since it involves human intervention|Since it is centralized management for secrets allowing us to easily CRUD secrets through its interface or APIs and also it supports neat features like automatic rotation of secrets, helping us maintain secrets without human intervention|

## Docker Network vs Host Network
- Bridge network allows containers to communicate with each other and the host
- Host network allows containers to use host's network directly, providing higher performance but less isolation

## Docker Volumes vs Bind Mounts

# Instructions (any relevant info about compilation, installation, and/or execution)

# Resources (references related to the topic)
## Links

- [docker-compose.yml](https://dev.to/wallacefreitas/10-best-practices-for-writing-maintainable-docker-compose-files-4ca2) best practices.
- [Official docker images.](https://hub.docker.com/)
- [Dockerfile](https://developers.redhat.com/articles/2023/03/23/10-tips-writing-secure-maintainable-dockerfiles) best practices.
- [Alpine penultimate](https://hub.docker.com/layers/library/alpine/3.23.2/images/sha256-16ff8a639f58b38d94b054e94c106dbbd8a60d45f8b1989f98516a3e8e0792ad), stable version (at this moment).
- [Containers VS Virtual Machines.](https://learn.microsoft.com/en-us/virtualization/windowscontainers/about/containers-vs-vm)
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) to correct the syntax of the READMEs.
- [Secrets VS Environmental variables](https://medium.com/smallcase-engineering/decoding-security-secret-manager-or-environment-variables-9b9beb7c35b7)

## Use of AI
- Check the syntax of docker-compose.yml, where to specify the services' version, and to generate scripts that create the inception's infrastructure.
- Generate a script that initializes folder structure and secret files. Check my other [repo](https://github.com/danielfdez17/scripts).
