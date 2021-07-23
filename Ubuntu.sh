# Become root
sudo su

# Update the Cache
apt update -y

# Install ansible
apt install ansible -y

# Check if you have Python installed
which python3

# Check if you have Ansible installed
which ansible

# Open Ansible configuration file
vim /etc/ansible/ansible.cfg
# Uncomment "inventory" and "sudo_user"

# Create a key.pem in "/etc/ansible/" and add your AWS key
vim /etc/ansible/key.pem

# Change the access permissions on the key
chmod 400 key.pem

# Open Ansible host file and add your host 
vim /etc/ansible/hosts
#################################################################################################
[Dev]
Node1 ansible_host=10.0.0.6 ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/key.pem
Node2 ansible_host=10.0.0.5 ansible_user=ec2-user ansible_ssh_private_key_file=/etc/ansible/key.pem
#################################################################################################

# Ping the hosts to make sure that they're connected to the master
ansible -m ping all 

# Create Ansible playbook
vim Apache.yml

# Run the ansible playbook
ansible-playbook Apache.yml