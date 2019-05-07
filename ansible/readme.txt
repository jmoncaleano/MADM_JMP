Requiere
Java

ssh-keygen -t rsa -P ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ssh localhost

ansible-playbook playbook.yml -i hosts -u root -k
