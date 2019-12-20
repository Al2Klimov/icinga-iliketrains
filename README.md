# Environment for reproducing the [Icinga 2 JSON-RPC bug](https://github.com/Icinga/icinga2/issues/7532)

1. Get Icinga 2 packages for Debian 10
2. Put them into the current directory as `icinga2-bin.deb` and `icinga2-common.deb`
3. Select one of [the cloud providers](./terraform) a Terraform environment spec is available for
4. Complete `provider.tf`
5. Deploy the environment
6. Create an Ansible inventory from the environment
7. Provision the environment via [the Ansible playbook](./ansible-playbook.yml)
8. Wait one day
9. If one of the masters is crashed, your Icinga 2 version is affected
