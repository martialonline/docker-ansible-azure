![Build](https://github.com/martialonline/docker-ansible-azure/workflows/Continuous%20Integration/badge.svg)

Small Docker container based on Alpine 3.11 including Ansible version 2.9.9 and the **Microsoft Azure** modules.

## Usage

Launch Docker container injecting Azure environment variables:

```bash
$ docker run -it \
  -v ~/ansible:/home/ansible \
  -e AZURE_CLIENT_ID \
  -e AZURE_SECRET \
  -e AZURE_SUBSCRIPTION_ID \
  -e AZURE_TENANT \
  martialonline/docker-ansible-azure:latest sh
```

### Test Ansible

```bash
$ ansible localhost -c local -m shell -a 'echo hello world'
localhost | CHANGED | rc=0 >>
hello world
```

### Build locally

Build the container locally

```bash
$ docker build -t docker-ansible-azure -f Dockerfile .
```