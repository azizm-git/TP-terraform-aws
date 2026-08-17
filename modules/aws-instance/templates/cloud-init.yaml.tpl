#cloud-config

hostname: ${hostname}
fqdn: ${hostname}

timezone: Europe/Paris

keyboard:
  layout: fr
  variant: azerty

users:
%{ for name, key in users ~}
  - name: ${name}
    groups: sudo
    shell: /bin/bash
    ssh_authorized_keys:
      - ${key}
    passwd: ${password_hash}
    lock_passwd: false
    sudo: ALL=(ALL) NOPASSWD:ALL
%{ endfor ~}

package_update: true
package_upgrade: true

packages:
  - vim
  - curl
  - htop

ssh_pwauth: true

runcmd:
%{ for name, key in users ~}
  - chmod 700 /home/${name}
%{ endfor ~}