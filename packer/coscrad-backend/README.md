# Overview
This [Packer](https://www.packer.io/) project provides the configuration for the base back-end
deployment for [COSCRAD web of knowledge](https://github.com/COSCRAD/coscrad). Running this project with Packer will
result in a DigitalOcean image, from which you can spin up ephemeral droplets.
This Digital Ocean image includes
- Nginx Reverse Proxy setup
<!-- TODO Make the sub-domain configurable -->
<!-- TODO Manage the cert externally -->
- SSL With Certbot autorenewal for subdomain `api.staging.coscrad.org`

## Environment
- `$DIGITALOCEAN_TOKEN` - Admin API Token for Digital Ocean so that you can create droplets.

## Usage
Inside this directory, run
> > > packer init

> > > packer build packer build -var 'version=<X.XX>' -var 'linux_user=<YOUR_ADMIN_USERNAME>' package.pkr.hcl

On Digital Ocean, go to `Create > Droplets`. Choose the `Snapshots` option and find
the image with your version number and timestamp. Proceed to create the droplet.
In practice, we use Terraform to autote this step.

## Post Provision
Note that it is still necessary to run
> > > LINUX_USER=<admin-user-name> source startup.sh
on a newly provisioned droplet built from the packer-baked snapshot. 