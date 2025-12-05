# AWS VPC Design – Interview Project

This repository contains the Infrastructure as Code (IaC) used to create a complete **AWS VPC network architecture** for an interview task, using **Terraform** in the **ap-south-1 (Mumbai)** region.

The design follows real-world cloud networking best practices with **public and private subnets, Internet Gateway, NAT Gateway, and proper route table configuration.**

---

## 📌 VPC Configuration

**VPC Name:** Interview-Vpc
**VPC CIDR Block:** `10.0.0.0/16`

The `/16` CIDR block was chosen because it provides **65,536 private IP addresses**, giving enough space for current resources and future expansion without IP exhaustion.

---

## 📌 Subnet Configuration

Four subnets were created inside the VPC:

### ✅ Public Subnets (Internet-facing)

| Subnet Name              | CIDR          | Availability Zone | Purpose                                  |
| ------------------------ | ------------- | ----------------- | ---------------------------------------- |
| Interview-subnet-public1 | `10.0.1.0/24` | ap-south-1a       | Load balancer, NAT Gateway, Bastion host |
| Interview-subnet-public2 | `10.0.2.0/24` | ap-south-1b       | High availability (multi-AZ support)     |

These subnets are associated with a route table that sends internet traffic to the **Internet Gateway (IGW)**.

---

### 🔒 Private Subnets (Secure/Internal)

| Subnet Name               | CIDR            | Availability Zone | Purpose                    |
| ------------------------- | --------------- | ----------------- | -------------------------- |
| Interview-subnet-private1 | `10.0.101.0/24` | ap-south-1a       | Backend servers, databases |
| Interview-subnet-private2 | `10.0.102.0/24` | ap-south-1b       | High availability backend  |

These subnets do NOT allow direct inbound internet access. Outbound internet access is provided through a **NAT Gateway** placed in a public subnet.

---

## 📌 Route Table Configuration

Two route tables were created:

### 1️⃣ Public Route Table

Associated with:

* Interview-subnet-public1
* Interview-subnet-public2

Routes:

```
0.0.0.0/0  →  Internet Gateway
```

This enables internet access for resources in the public subnets.


### 2️⃣ Private Route Table

Associated with:

* Interview-subnet-private1
* Interview-subnet-private2

Routes:


0.0.0.0/0  →  NAT Gateway


This allows private subnet resources to access the internet **securely for updates and downloads** without exposing them to incoming traffic.



## 📌 Internet Gateway (IGW)

An Internet Gateway was attached to the VPC to provide direct internet connectivity to all resources placed in the **public subnets**.

**Name:** Interview-IGW

---

## 📌 NAT Gateway

A NAT Gateway was deployed in **Interview-subnet-public1** and linked to an Elastic IP.
It enables instances in the **private subnets** to connect to the internet for patches and updates while remaining completely hidden from external inbound traffic.

This adds a strong layer of **security and isolation**.

---

## ✅ CIDR Range Summary

| Resource         | CIDR            |
| ---------------- | --------------- |
| VPC              | `10.0.0.0/16`   |
| Public Subnet 1  | `10.0.1.0/24`   |
| Public Subnet 2  | `10.0.2.0/24`   |
| Private Subnet 1 | `10.0.101.0/24` |
| Private Subnet 2 | `10.0.102.0/24` |

**Reasoning for this design:**

* Lower ranges (10.0.1.0 & 10.0.2.0) are reserved for public access
* Higher ranges (10.0.101.0 & 10.0.102.0) are used for private workloads
* The numbering is easy to read, manage, and scale in future projects

---

## 📌 Folder Structure


aws-vpc-interview-project/
│
├── main.tf
├── variables.tf
├── outputs.tf
└── README.md


## 🛠 Tools & Services Used

* AWS VPC
* Subnets
* Route Tables
* Internet Gateway (IGW)
* NAT Gateway
* Elastic IP
* Terraform
* GitHub

---

## ▶️ How to Deploy

1. Clone the repository:

   ```
   git clone https://github.com/[your-username]/aws-vpc-interview-project
   ```

2. Initialize Terraform:

   ```
   terraform init
   ```

3. Apply the configuration:

   ```
   terraform apply
   ```

---

## ✅ Final Outcome

This setup creates a secure, scalable, and highly available AWS networking environment following industry best practices.
It clearly separates public and private resources, ensures safe internet access through a NAT Gateway, and supports multi-AZ architecture for reliability.

This project demonstrates strong understanding of **cloud networking, IP management, and infrastructure automation.**






I selected the VPC CIDR range as 10.0.0.0/16 because it provides a large private IP address range (65,536 addresses), which allows flexibility and future scalability without the risk of IP exhaustion.
Inside this VPC, I divided the network into four /24 subnets to separate traffic and improve security:
10.0.1.0/24 and 10.0.2.0/24 were chosen for the public subnets. These are used for internet-facing resources like web servers and NAT Gateway and are connected to the Internet Gateway.
10.0.101.0/24 and 10.0.102.0/24 were chosen for the private subnets. These are used for secure resources such as databases and backend servers, and they do not allow direct internet traffic.
I intentionally kept a gap between the public and private subnet ranges to make the network cleaner, more readable, and easier to manage in a real-world production environment.
This makes your design look intentional and professional.

# AWS VPC Setup - Interview Project

This repository contains Terraform code to create:

- 1 VPC (10.0.0.0/16)
- 2 Public Subnets (10.0.1.0/24, 10.0.2.0/24)
- 2 Private Subnets (10.0.101.0/24, 10.0.102.0/24)

Region: ap-south-1 (Mumbai)


