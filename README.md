# Coscrad Infra
This repo contains the infrastructure-as-code components for continuous
delivery and deployment of builds for the [COSCRAD web of knowledge platform](https://github.com/COSCRAD/coscrad). 

Note that we use [Jenkins]() as our automation server. Our `Jenkinsfile` is maintained
alongside our source code in the main COSCRAD monorepo. 

## Continuous Delivery and Deployment
### Front-end (COSCARD Web Client)
Our front-end delivery is via transfering static assets to a persistent web server environment. This is handled entirely through Jenkins.

### Coscrad Back-end and API
#### Packer 
We use [Packer](https://www.packer.io) to "bake" Digital Ocean images for
each new set of back-end build artifacts. 

- [packer/coscrad-backend](./packer/coscrad-backend/README.md)