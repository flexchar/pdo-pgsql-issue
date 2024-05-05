# Reproduction of PDO_PGSQL and Swoole Extension Issue

This repository contains Dockerfiles, scripts, and instructions to reproduce an issue where the `pdo_pgsql` extension in combination with the `php82-pecl-swoole` extension causes a connection failure in PHP on Alpine Linux 3.19 or Edge, while it works correctly on Alpine Linux 3.18.

The connection only fails when connecting with the instance running on the host. It does however work if connecting from one container to another.

## Overview

The issue manifests as a failure in establishing a PDO connection to a PostgreSQL database when using the `php82-pdo_pgsql` and `php82-pecl-swoole` extensions together on Alpine Linux 3.19. The same setup works correctly on Alpine Linux 3.18.

## Prerequisites

-   Docker must be installed on your machine.
-   Ensure no other processes are using port 5430 on your machine. Or edit the files to change the ports

## How to Reproduce

### Step 1: Clone the Repository

Clone this repository to your local machine and navigate to the directory containing the Dockerfiles and scripts.

### Step 2: Run the Script

Execute the `script.sh`, which automates the following tasks:

-   Starts a PostgreSQL container on port 5430.
-   Builds Docker images for both the working case (Alpine 3.18) and the broken case (Alpine 3.19).
-   Runs both images to test the PDO connection.
-   Cleans up by removing the created images and stopping the PostgreSQL container.

```bash
./script.sh
```

### Step 3: Observe the Output

The script will output the results of the connection attempts from both Docker containers:

-   The container based on Alpine 3.18 should successfully connect to the PostgreSQL database.
-   The container based on Alpine 3.19 is expected to fail to connect due to the issue with the combination of extensions.

> You can comment out the `swoole` extension install line in Dockerfile and observe it work.

Reported at

-   https://github.com/swoole/swoole-src/issues/5313
