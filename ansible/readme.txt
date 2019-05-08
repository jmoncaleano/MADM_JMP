- Requerimientos:
  Java

- Configurar la conexiòn SSH sin contraseña:
  ssh-keygen -t rsa -P ""
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

- Ejecutar el comando ansible con usuario root:
  ansible-playbook playbook.yml -i hosts -u root -k

- Bibliografìa:
  https://github.com/sirkjohannsen/ansible-role-metricbeat
  https://github.com/gofynd/ansible-metricbeat
  https://github.com/geerlingguy/ansible-role-kibana
  https://github.com/geerlingguy/ansible-role-elasticsearch
