# KernelCi Builder Config

Ansible-based configuration for Linux kernel builders.

Some necessary files/directories are missing from this repository since they
contain secrets. In order to make the ansible commands work, those files are
necessary and need to be linked in the repository.

The host names in the [./hosts](hosts) file are define and used only internally
for the ansible configurations. The real host names and/or their IP addresses
are stored in either the ``group_vars/`` or ``host_vars/`` directory.

## Run the Configuration

To just go through all the tasks, useful to setup a new builder:

    ansible-playbook -i hosts site.yml -u $your_ssh_user_name -K

This assumes that you have configured access to the hosts in your .ssh config
file.

## Other Useful Commands

To check the [http://docs.ansible.com/ansible/setup_module.html](facts) on a host:

    ansible hostname -m setup -i hosts
