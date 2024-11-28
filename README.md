This project provides a **fully automated environment** for deploying and testing a high availability (HA) server infrastructure using Vagrant. The setup includes:

## Project Overview

This project provides a **fully automated environment** for deploying and testing a high-availability (HA) server infrastructure using **Vagrant**. The setup includes the following key components:

- **Corosync & Pacemaker**: Used for clustering and resource management, ensuring high availability and automatic failover. **Pacemaker** and **Corosync** are specifically used to manage the **HAProxy nodes** and **MariaDB nodes**, providing fault tolerance and seamless failover for both.

- **GlusterFS**: A distributed file system for data redundancy and high availability, ensuring that the storage layer is resilient and can withstand node failures.

- **HAProxy**: A high-performance load balancer used to distribute traffic evenly across the two **load-balanced web servers**. The HAProxy nodes are also managed by **Pacemaker & Corosync** for high availability.

- **Vagrant**: Automates the creation and configuration of virtual machines, enabling easy and reproducible environments for testing and development.

### Architecture Highlights:
- Two **load-balanced web servers** are deployed, ensuring high availability for your web application.
- **Pacemaker & Corosync** manage the failover and clustering of **HAProxy nodes** and **MariaDB nodes**, ensuring that these critical components remain highly available and resilient to failures.


## How to Run

1. **Run the Build Script**  
   Open a terminal and navigate to the directory where `build.ps1` is located. Then, execute the following command:

   ```bash
   ./build.ps1

It should take about 30 minutes for everything to be ready.

Yes, this was a school project.
