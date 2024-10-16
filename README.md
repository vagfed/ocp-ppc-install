# ocp-ppc-install

Automated install of a full OpenShift cluster on IBM Power LPAR using Ansible. Internet access is required for all LPARs involved, with the option of using an HTTP proxy (with optional user/password).

The scripts must be copied on an IBM Power LPAR configured with RHEL 9. Other Linux flavours should work but they may require some editing of scripts since some configuration files may be different. This LPAR will be configured to allow network installation of OpenShift cluster. This LPAR is ideally loacated in the same network of OCP cluster but it is not mandatory. 

All LPARs in the OCP cluster must be located in the same subnet. They will use BOOTP, TFTP and HTTP protocols to contact the LPAR from where installation is started using the scripts, so routing is required and no firewall should be present. 

DHCP is not used and all LPARs will use fixed IP addresses. You will see DHCP daemon configured but it will answer only to BOOTP requests from well known MAC addresses. If your network already had DHCP running, you can safely use this procedure.

DNS resolution (direct and reverse) is required for all LPAR's IP addresses. A load balancer is mandatory and must be configured as described by OpenShift documentation.

## Initial setup of installation server
Create a new user called "ansible" and allow it to run as root with sudo. You can use the following commands as root:

```
useradd ansible
echo 'ansible ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/ansible
chmod 644 /etc/sudoers.d/ansible
```

Then switch as user ansible using `su - ansible`.

Now clone the repository as ansible user.

The required packages are installed running (once) the script `setup_ansible.sh`

## OpenShift LPAR creation 
You need to create in advance all LPARs that will be used during OCP installation. A minimum set includes 1 bootstrap, 3 masters and 2 workers. If you plan to use infrastructure nodes, they will be installed as workers and you will change them as infrastructure nodes after installation completes.

Each LPAR must have only 1 Ethernet adapter during installation time. Scripts have been tested with virtual Ethernet but should work with vNIC or other adapters. This procedure do not support more than one adapter: if you need additional adapters, they must be addded after OpenSHift installation.

Each LPAR must have only one disk during installation time. Scripts will use `sda` disk as target disk and then will enable multipath. If multiple disks are present, it is not possible to choose the installation disk, so add disks after installation has completed.

## Variable definitions

You must be sure that the LPAR configuration and HMC definitions are current in 
the `lpar.yml` and `hmc.yml` files located into the `vars` directory. You must provide your RedHat pull secret and store it in the `vars\pullsecret` file. Remember that file content is case sensitive.

The partition where Ansible scripts are executed will be configured ad BOOTP, TFTP and HTTP servers. The OCP LPAR will be installed using those protocols and firewall must not stop them. 

### hmc.yml
This file defines the `hmc` variable that defines all involved HMCs during the installation. For each HMC you must provide a label (just a name to identify it), together with its IP address and user/password for authentication. Look at existing file for a working example.

### lpars.yml
This file defines the `lpars` variable that defines all LPARs in the OCP cluster. The key is the LPAR name and then you need to provide the label used in `hmc.yml` file to identify the HMC that manages the system. For each LPAR you must provide the IP address that will be assigned to the LPAR and the name of its managed system.

Suppose that you are adding a WORKER3 partition with IP address 10.1.1.1 on managed system SYSTEM1. The HMC that manages SYSTEM1 has been defined with the label HMC5 on `hmc.yml` file. In the `lpars.yml` file you need to have the following stanza:

`
lpars:
  WORKER3:
    ip: 10.1.1.1
    hmc: HMC5
    managed_system: SYSTEM1
`

The `network.yml` file located into the `vars` directory provides the network configuration of the network hosting the OCP LPAR and provide the IP address of the partition used for installation (bastion, thw host where ansible scripts will be run).

The `ocp.yml` file located into the `vars` directory provides the OpenShift installation data. You need to provide your pull secret.


### network.yml
This file defines the network configuration of all LPARs and the boot server (named `pxe_server`) from where you are running the scripts.

All OCP LPARs must be on the same subnet. You must provide the IP name of the subnet and the netmask to be applied to each LPAR. I suggest you to use `https://www.calculator.net/ip-subnet-calculator.html`, insert the IP address on one LPAR, provide the netmask and it will compute the correst IP name of the subnet.

### nodes.yml
This file identifies the bootnode, the three master nodes and the workers you want to install. For each LPAR you need to provide the name of the corresmponding LPAR as shown in the HMC, together with the hostname without any domain name.

## ocp.yml
This file provides the primary OpenShift configuration details.

`basedomain` represents the parent's DNS domain of the OCP cluster. All OCP nodes must belong to this domain and must be defined in DNS for both direct and reverse resolution. For example if `basedomain` is `power.seg.it.ibm.com` and a node has IP 10.10.1.1 and hostname `node1`, on DNS you need to have a resolution `node1.power.seg.it.ibm.com <-> 10.10.1.1`.

`clustername` is the name of the OCP cluster. There will be a subdomain named `<clustername>.<basedomain>`.

`clusternetwork` and `servicenetwork` are the internal OCP networks. They should not overlap with existing networks.

`balancer` is the external load balancer that must be configured in advance to provide service to the OCP cluster. If it is not correctly configured, the installation will fail.

The installation depends on internet access. If you need to specify an HTTP proxy, uncomment and update the `proxy` definition, together with all `http`, `https` and `noproxy` definitions (they all all mandatory). If you define a proxy server, OCP will route all outgoing traffing through the proxy: if you want to avoid proxy usage for an IP subnet ot DNS domain, provide noproxy information as shown in the example (see RedHat documentation for details).

Do not change `ocp_installer` variable unless you know what are you doing.

### pullsecret
This file in not present when you clone the repository but you must provide it before starting the installation. It is related to the email that owns a subscription and can be retrieved from `https://console.redhat.com/openshift/install/pull-secret`.

## Advanced tuning
The procedure will use the variables you define to create an OpenShift installation file. The template of the file is defined in `template\install_config.j2` that can be edited for advanced configuration.

You can further tune your environment by providing YAML files into `ocp_custom_yaml`. They will be passed during installation. In the repository there are two files required in environments that use Virtual Ethernet through Shared Ethernet Adapter for OCP LPARs.

Multipath I/O for disk will be enabled during installation and does not require any setup.

## Installation start
Once you have provided all variables and customization, installation is started by running `ansible-playbook install_ocp.yml`. Installation will not ask any confirmation and will poweroff all involved LPAR before staring real installation.

A successfull installation will require from 1 to 2 hours of time and will not require any user activity.

## Configuration files required to manage the cluster
The `OCP_DATA` directory will contain one directory for each cluster you create. If you run multiple time the scripts with the same clustername, the data will be completely rewritten.

The `OCP_DATA/<clustername>` directory contains all the data useful to manage the OCP cluster and to know how it was installed. All files should be kept in a safe place. 
- `install-config.yaml.backup`: the yaml file used to install the cluster
- `ocp-rsa`: this is the private key you can use to log on OCP nodes using the `core` user (`ssh -i ocp-rsa core@<node>`)
- `setup/auth/kubeconfig`: KUBECONFIG file to be used when executing the `oc` command
- `setup/auth/kubeadmin-password`: the default password of the `kubeadmin` user of the cluster 


## Debug activity during installation
Installation is meant to run unattended and does not require any user interaction.

You may want to log on the LPARs to monitor the installation or just to see logs. In worst cases you may need to perform problem determination for failed installation.

### Console access.
Do not attempt to access a LPAR's console before the LPAR has been started for installation. For example you can access the console of LPAR `TFV-OCPTEMP-boot` only after you see the dollowing message:

```
TASK [Boot all LPARs and start network installation] *********************************************************************
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})
```

From the console you can only see console messages. You do not have any valid credential to log on the console.


### SSH access as core user
You can access anytime to any node as `core` use by using the generated SSH key. Of course you need to wait for SSH service to be started: console logs will tell you when.

As `core` user you can use `sudo` to become `root` but you should avoid it unless you know ehat you are doing. The best way to monitor the installation is to use the `journalctl -f` command. When you log on bootstrap node you will see a better suggestion.


## Known installation issues
Please use RHEL 9.3 or later. With previous versions the LPARs may fail to boot with error code BA060030 on HMC when installing a new LPAR with virtual cores.

Previous RHEL versions have an issue in network boot images. If you can not upgrade RHEL the workaround is to modify the LPAR to use dedicated cores and restart the installation. Once OpenShift is installed, you can power off the LPAR and change the configuration to use virtual cores. When you start the LPAR again OpenShift will correctly work. If you ever installed on the same LPAR an operating system capable of using virtual CPUs, the OopenShift installation will complewte successfully.


## Sample log output
You can find a sample installation log into file [sample_log.md](sample_log.md)


