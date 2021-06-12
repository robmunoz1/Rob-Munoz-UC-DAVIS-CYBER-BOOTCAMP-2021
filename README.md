# Rob-Munoz-UC-DAVIS-CYBER-BOOTCAMP-2021
Class Project 1
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/robmunoz1/Rob-Munoz-UC-DAVIS-CYBER-BOOTCAMP-2021/blob/main/Diagrams/_Rob%20Munoz_%20Cloud%20Secuirty.png?raw=true)

The associated files in have been tested during the UC Davis Bootcamp lectures to generate a live ELK deployement in an Azure Environment.  THey can be used to create the entire deployment pictured above, or individually, select portions can be installed, such as filebeat.

- Ansible/Pentest.yml -- Is deployed from the ansible container in the jumpbox to install and launch DVWA containers in virtual web machines.  For my environment they were pushed to Web-1, Web-2, and Web-3.  The appropriate public ip should be configured into the [webservers] config file in the ansible container.  For this configuration we had to configure 8080 on our network security group
- Ansible/install-elk.yml -- This file is deployed from the ansible container on your jump box to install and launch ELK in your ELK virtual machine.  For this class we stood up our ELK machine instance in another geo location and set up peering between both virtual networks.  For this configuration we had to configure 5601 on our network security group.
- Ansible/filebeat-playbook.yml -- This playbook installs and launches filebeat to the DVWA configured servers.  In my environment these were web 1-3.  Filebeat sends logs to our ELK server for analysis.
- Ansible/metricbeat-playbook.yml -- This playbook installs and launches metricbeat to the DVWA configured servers.  In my environment these were web 1-3.  Metricbeat is a lightweight shipper that records and collects metrics from the operating system and from services running on the server.

This document contains the following details: 
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application. The importance of a jumpbox is that it is connected to two networks.  The first network is your common network and the second is a secured environment.  This allows the user/organization to harden their secured environment and directly control access to that environment.

Load balancing ensures that the application will be highly availble in addition to restricting access to the network.
-The load balancer plays and important role in security as it protects your environment from distributed denial-of-service (DDOS) attacks.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system metrics
- Filebeat monitors the log files or locations that you specify and collects these logs and forwards them to Elasticsearch or Logstach for indexing.
- Metricbeat is a lightweight shipper that records and collects metrics from the operating system and from services running on the server.

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.7   | Linux            |
| Web-1    | Webserver| 10.0.0.4   | Linux            |
| Web-2    | Webserver| 10.0.0.5   | Linux            |
| Web-3    | Webserver| 10.0.0.6   | Linux            |
| ELK Server| Elkserver|10.2.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump box machine can accept connections from the Internet. Access to this machine is only allowed from home network IP.

Machines within the network can only be accessed by by my home IP.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |        No           | Home network IP      |
| Web-1    |        No           | 10.0.0.7             |
| Web-2    |        NO           | 10.0.0.7             |
| Web-3    |        No           | 10.0.0.7             |
| Elk Server|        No           | 10.0.0.7             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because minimizes the potential for error and saves time by allowing the user to push out installations potentially across a huge environment

The playbook implements the following tasks:
- Configure Webserver
- Install Docker
- Install Docker Python
- Increase memory
- Download and install the ELK Container
- Enable launch of ELK on start

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![DOCKER PS](https://github.com/robmunoz1/Rob-Munoz-UC-DAVIS-CYBER-BOOTCAMP-2021/blob/main/Diagrams/DOCKER%20PS.PNG?raw=true)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 - 10.0.0.4
- Web-2 - 10.0.0.5

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat monitors the log files or locations that you specify and collects these logs and forwards them to Elasticsearch or Logstach for indexing.
- Metricbeat is a lightweight shipper that records and collects metrics from the operating system and from services running on the server.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
ou should already be in your Ansible VM. Add an [elk] group to your Ansible VM's hosts file by following the steps below on the command line:


Edit the inventory file vi /etc/ansible/hosts.


Add a group called [elk] and specify the IP address of the VM you just created in Azure.
- Copy the elk-install.yml file to /etc/ansible/roles.
- Update the hosts files to include webservers IPs and ElkServer2 IP

![WebServers](https://github.com/robmunoz1/Rob-Munoz-UC-DAVIS-CYBER-BOOTCAMP-2021/blob/main/Diagrams/webservers.PNG?raw=true)
- Run the playbook, and navigate to HTTP://<ELKServer_Public_IP>:5601 to check that the installation worked as expected.
- After the playbook completes, you should still be in the Ansible container. From there, use the command line to SSH into the ELK server and ensure that the sebp/elk:761 container is running by running: docker ps.
- Update each configuration file with ELKServer IP
    * Kibana - uncomment and replace localhost with local IP for ELK Server
    * Elasticsearch - uncomment and replace localhost with local IP for ELK Server

