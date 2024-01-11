# polytech-openstack-project

## Heat

First download the OpenStack RC file from the OpenStack dashboard and source it.

```bash
openstack stack create -t main.yaml -e variables.yaml my-wordpress-stack --insecure
```

## Terraform

First download the OpenStack `Clouds.yaml` file from the OpenStack dashboard and place it in the root of the project.

```bash
terraform init
terraform plan
terraform apply
```

## Ansible

First download the OpenStack `Clouds.yaml` file from the OpenStack dashboard and place it in the root of the project.

```bash
sudo ansible-playbook -i inventory/inventory.ini playbook.yaml
```
