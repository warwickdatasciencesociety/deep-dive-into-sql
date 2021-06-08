## Overview

**This directory is intended only for instructors of the course, not participants.**

This directory contains the code to initialise a database server that can be used to run WDSS's _SQL for Scientists_ course. The entire solution is containerised with Docker, which should ensure reproducibility and ease of deployment.

## Setup

### Prerequisities

- An installation of Docker (17.06.0+)
- An installation of Docker Compose (3.3+)
- A cloned version of this repository on your database server

### Initialisation

1. Navigate to the `server` directory
2. Initialise the docker container with `docker-compose up -d` (may require `sudo`)
3. The service runs on port 33060, ensure that this is accessible (e.g. by opening the port in the [firewall](https://www.cyberciti.biz/faq/how-to-open-firewall-port-on-ubuntu-linux-12-04-14-04-lts/))
4. (Optional) create an A Record in `wdss.io`'s DNS settings (via Namecheap) 

### Useage

Course participants can now connect to the server using a client of their choose (I recommend Beekeeper studio) using the following configuration:

- Username: `guest`
- Password: `relational`
- Host: Server IP or domain
- Port: `33060`

### Deactivation

1. Navigate to the `server` directory
2. Run `docker-compose down`

## Modification

- You can change the databases that are imported by modifying the list at the beginning of `init.sh`

## Notes

- The version of MySQL used for this image is pinned at version 8.0 for future-proofing.
- Due to some peculiarities with how Docker caches images (I'm yet to figure out the details), it is best to run `docker-compose down --rmi` followed by `docker-compose up -d --build` when reloading the container after making changes to the Docker/compose file
- If you want to debug issues with the container, drop the `-d` flag from the initialisation steps
- The docker container has no persistant storage, so any changes to the 
