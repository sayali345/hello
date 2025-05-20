
===================== ssh keygen in server/master  ==========

generate ssh key copy the public key and paste in client authorized_keys 


======= install anisible package ============

sudo apt install ansible 

====make directory========
	
	make directory -->>> create ansible related files 





============== install-a2.yml ===================


---
- name: Install apache2 on Debian
  hosts: webservers
  become: yes
  tasks:
    - name: Update apt cache
      ansible.builtin.apt:
        update_cache: yes

    - name: Install apache2
      ansible.builtin.apt:
        name: apache2
        state: present

    - name: Ensure apache2 is running
      ansible.builtin.service:
        name: apache2
        state: started
        enabled: yes





================= inventory.ini ======================[webservers]


managed_node ansible_host=192.168.100.101 ansible_user=star           ======>>>> client ip and username 



============= /etc/default/locale ===============


LANG="     .UTF-8"
LC_ALL="      .UTF-8"

sudo locale-gen en_In.UTF-8
sudo update-locale

reboot
	
==================== type these commands ==================



  ansible-playbook -i inventory.ini install-a2.yml
   ansible -m ping all


============ check in client   ==========


sudo systemctl status apache2


