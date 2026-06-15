# Dynamic-Security-Group-Provisioner

Project Description – Dynamic Security Group Provisioner

This project demonstrates how Ansible and Terraform can be integrated to automate cloud security management through dynamic IP whitelisting. Instead of manually editing Terraform configuration files whenever approved SSH access changes, the solution automatically reads a security team's approved IP list, converts it into Terraform variables, and provisions an AWS Security Group with the correct firewall rules.

Project Objectives
Automate SSH access control using Infrastructure as Code (IaC).
Eliminate manual updates to security group configurations.
Dynamically generate Terraform variables from external data sources.
Enforce security best practices through IP whitelisting.
Integrate Ansible templating with Terraform provisioning.
Workflow Overview
1. Read Approved IP Addresses

The security team maintains a simple text file:

approved_ips.txt

Each line contains an approved IP address that should be allowed to access servers via SSH.

Example:

192.168.1.10
10.0.0.15
172.16.5.20
2. Generate Terraform Variables (Ansible)

Ansible uses a Jinja2 template (vars.j2) to:

Read the IP addresses directly from approved_ips.txt.
Convert each IP into CIDR notation by appending /32.
Generate a Terraform variable file:
terraform.tfvars

Example generated output:

allowed_ips = [
  "192.168.1.10/32",
  "10.0.0.15/32",
  "172.16.5.20/32",
]

This allows Terraform to consume the approved IP list automatically.

3. Provision the Security Group (Terraform)

Terraform creates an AWS Security Group:

company-secure-ssh

The security group:

Allows inbound SSH traffic.
Uses TCP protocol.
Restricts access to only the approved IP addresses defined in allowed_ips.
Blocks unauthorized access attempts.

Example rule:

Port: 22
Protocol: TCP
Source: Approved CIDR blocks only
Technologies Used
Ansible
Jinja2 templating
File lookup plugin
Variable generation
Automation workflows
Terraform
Infrastructure as Code (IaC)
AWS Security Group provisioning
Dynamic variable consumption
AWS Security Groups (Moto Emulator)
Network access control
Firewall rule management
SSH access restriction
DevOps Concepts Demonstrated
Infrastructure as Code (IaC)
Security Automation
Dynamic Configuration Management
IP Whitelisting
Firewall Provisioning
Ansible Templating
Terraform Variables
Cloud Security Best Practices
Automated Infrastructure Deployment
Expected Outcome

After running the workflow:

Ansible reads approved_ips.txt.
A terraform.tfvars file is generated automatically.
Terraform loads the generated variables.
A Security Group named company-secure-ssh is created.
Only approved IP addresses are allowed to connect via SSH on port 22.
Security policies can be updated simply by modifying the text file and rerunning the pipeline.
Business Value

This project simulates a real-world enterprise security workflow where security teams maintain approved access lists while DevOps engineers automate infrastructure updates. By separating security data from infrastructure code and generating configurations dynamically, organizations improve security, reduce manual errors, and ensure that cloud environments always reflect the latest access policies.
