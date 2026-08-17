#cloud-config

hostname: ${hostname}
fqdn: ${hostname}
prefer_fqdn_over_hostname: false

keyboard:
  layout: fr

timezone: Europe/Paris

locale: fr_FR.UTF-8

users:
  - name: ${username}
    home: /home/${username}
    shell: /bin/bash
    sudo: ALL=(ALL) NOPASSWD:ALL
    lock_passwd: false
    passwd: ${password_hash}
    ssh_authorized_keys:
      - ${ssh_public_key}

ssh_pwauth: true

package_update: true

packages:
  - vim
  - curl
  - htop

runcmd:
  - rm -f /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
  - echo "PasswordAuthentication yes" > /etc/ssh/sshd_config.d/99-tp-cloudinit.conf
  - systemctl restart ssh