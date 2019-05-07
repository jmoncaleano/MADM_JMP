Requiere
Java

ssh-keygen -t rsa -P ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ssh localhost

ansible-playbook playbook.yml -i hosts -u root -k

https://github.com/sirkjohannsen/ansible-role-metricbeat

https://github.com/gofynd/ansible-metricbeat

https://github.com/geerlingguy/ansible-role-kibana

https://github.com/geerlingguy/ansible-role-elasticsearch
