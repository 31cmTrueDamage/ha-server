This project provides a **fully automated environment** for deploying and testing a high availability (HA) server infrastructure using Vagrant. The setup includes:

- **Corosync & Pacemaker**: Clustering and resource management for high availability and automatic failover.
- **GlusterFS**: A distributed file system for redundancy and high availability of data.
- **HAProxy**: A load balancer to distribute traffic across HA setup and ensure even load balancing.
- **Vagrant**: Automates virtual machine setup and configuration, enabling reproducible environments.

## How to Run

1. **Run the Build Script**  
   Open a terminal and navigate to the directory where `build.ps1` is located. Then, execute the following command:

   ```bash
   ./build.ps1

It should take about 30 minutes for everything to be ready.

Yes, this was a school project.
