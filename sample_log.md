[ansible@tfv-temp ocp-ppc-install]$ ansible-playbook install_ocp.yml

PLAY [Store known hosts of all HMCs] *************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************
ok: [localhost]

TASK [Detect HMC IPs] ****************************************************************************************************
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-boot', 'value': {'ip': '172.17.227.61', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-m1', 'value': {'ip': '172.17.227.62', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-m2', 'value': {'ip': '172.17.227.63', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-m3', 'value': {'ip': '172.17.227.64', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-w1', 'value': {'ip': '172.17.227.65', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-w2', 'value': {'ip': '172.17.227.66', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})

TASK [Scan ssh public keys of HMC] ***************************************************************************************
changed: [localhost] => (item=vhmc-p901)

TASK [Collect all SSH keys] **********************************************************************************************
ok: [localhost] => (item={'changed': True, 'stdout': '172.17.251.91 ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFETg9vxcTrPro9nj1xpTeNaqm9JrggRTgeokTwmuUUQIxUlzvDPGjcTfgngJJWVmUTz5OgqUCBS6ulY+sFmqPQogA4/ozt0EvS3zIGGloTyMSZ1NgzbAfwg5mJRHSpKiYKqzawA9c1q/SDug5ie+nQtXXlhMb4S2gXq5xXaDhkOwrxcw==\n172.17.251.91 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRvu/cT7CEFr+OMssg2Igr/nlSxukdN7S8VZ45mtgeOGETk1Cnex0RT8tyssVZOk9LP+89kPkDA1DR7avF8kfuqDe6DBlBhIO7MZk+SJW5beDQwmjnJHghxxlJI5WK7+gUwzRhdf4fc5Hte0ghhbcVsRLJlcZNQNoNj6+dewN0gYwIYnzJ3Jr1ryA7fq7Uq3+zzclryVFblm/RiZeuSXqmUDed6IndchRXYrjhbWUF35tc/s6YT+n0hK0cZikebq6vSMyi/qjZ16oosoYMHbSnfoTNwOwUlvmg1BH2eTAI6IF+ppAp4pUNGSJ6BF8sfmMi5CB+/TCIMlzVmgW4kNayyDY2m0amwfs8vwfHHobwxDW8pcpuHg6HXhdETRYtdcjTvcPciOojp32cQZojSWfmnMh4Gu4bGFdZfwlme2m/knhzAp2RuKzVwOHYrSVuy4x7nriBk2BGQrZGURRcJGjWZgvQkOZuQqMEV4cSm2h5h0lWbaskC5juMlfgYHm9+pk=\n172.17.251.91 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEy4+G8KhdrzIJ/0Rb7FltYhpXNEahZJTEkKN42D/c6a', 'stderr': '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0\n# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0\n# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0\n# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0\n# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', 'rc': 0, 'cmd': 'ssh-keyscan 172.17.251.91', 'start': '2024-09-03 15:28:54.282852', 'end': '2024-09-03 15:28:54.348702', 'delta': '0:00:00.065850', 'msg': '', 'invocation': {'module_args': {'_raw_params': 'ssh-keyscan 172.17.251.91', '_uses_shell': True, 'stdin_add_newline': True, 'strip_empty_ends': True, 'argv': None, 'chdir': None, 'executable': None, 'creates': None, 'removes': None, 'stdin': None}}, 'stdout_lines': ['172.17.251.91 ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFETg9vxcTrPro9nj1xpTeNaqm9JrggRTgeokTwmuUUQIxUlzvDPGjcTfgngJJWVmUTz5OgqUCBS6ulY+sFmqPQogA4/ozt0EvS3zIGGloTyMSZ1NgzbAfwg5mJRHSpKiYKqzawA9c1q/SDug5ie+nQtXXlhMb4S2gXq5xXaDhkOwrxcw==', '172.17.251.91 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRvu/cT7CEFr+OMssg2Igr/nlSxukdN7S8VZ45mtgeOGETk1Cnex0RT8tyssVZOk9LP+89kPkDA1DR7avF8kfuqDe6DBlBhIO7MZk+SJW5beDQwmjnJHghxxlJI5WK7+gUwzRhdf4fc5Hte0ghhbcVsRLJlcZNQNoNj6+dewN0gYwIYnzJ3Jr1ryA7fq7Uq3+zzclryVFblm/RiZeuSXqmUDed6IndchRXYrjhbWUF35tc/s6YT+n0hK0cZikebq6vSMyi/qjZ16oosoYMHbSnfoTNwOwUlvmg1BH2eTAI6IF+ppAp4pUNGSJ6BF8sfmMi5CB+/TCIMlzVmgW4kNayyDY2m0amwfs8vwfHHobwxDW8pcpuHg6HXhdETRYtdcjTvcPciOojp32cQZojSWfmnMh4Gu4bGFdZfwlme2m/knhzAp2RuKzVwOHYrSVuy4x7nriBk2BGQrZGURRcJGjWZgvQkOZuQqMEV4cSm2h5h0lWbaskC5juMlfgYHm9+pk=', '172.17.251.91 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEy4+G8KhdrzIJ/0Rb7FltYhpXNEahZJTEkKN42D/c6a'], 'stderr_lines': ['# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0'], 'failed': False, 'item': 'vhmc-p901', 'ansible_loop_var': 'item'})

TASK [Make sure that .ssh exists in /home/ansible] ***********************************************************************
ok: [localhost]

TASK [Update known hosts for HMC] ****************************************************************************************
ok: [localhost] => (item=172.17.251.91 ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFETg9vxcTrPro9nj1xpTeNaqm9JrggRTgeokTwmuUUQIxUlzvDPGjcTfgngJJWVmUTz5OgqUCBS6ulY+sFmqPQogA4/ozt0EvS3zIGGloTyMSZ1NgzbAfwg5mJRHSpKiYKqzawA9c1q/SDug5ie+nQtXXlhMb4S2gXq5xXaDhkOwrxcw==)
ok: [localhost] => (item=172.17.251.91 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRvu/cT7CEFr+OMssg2Igr/nlSxukdN7S8VZ45mtgeOGETk1Cnex0RT8tyssVZOk9LP+89kPkDA1DR7avF8kfuqDe6DBlBhIO7MZk+SJW5beDQwmjnJHghxxlJI5WK7+gUwzRhdf4fc5Hte0ghhbcVsRLJlcZNQNoNj6+dewN0gYwIYnzJ3Jr1ryA7fq7Uq3+zzclryVFblm/RiZeuSXqmUDed6IndchRXYrjhbWUF35tc/s6YT+n0hK0cZikebq6vSMyi/qjZ16oosoYMHbSnfoTNwOwUlvmg1BH2eTAI6IF+ppAp4pUNGSJ6BF8sfmMi5CB+/TCIMlzVmgW4kNayyDY2m0amwfs8vwfHHobwxDW8pcpuHg6HXhdETRYtdcjTvcPciOojp32cQZojSWfmnMh4Gu4bGFdZfwlme2m/knhzAp2RuKzVwOHYrSVuy4x7nriBk2BGQrZGURRcJGjWZgvQkOZuQqMEV4cSm2h5h0lWbaskC5juMlfgYHm9+pk=)
ok: [localhost] => (item=172.17.251.91 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEy4+G8KhdrzIJ/0Rb7FltYhpXNEahZJTEkKN42D/c6a)

PLAY [Install services] **************************************************************************************************

TASK [Install EPEL] ******************************************************************************************************
ok: [localhost]

TASK [Install Linux packages] ********************************************************************************************
ok: [localhost]

TASK [Collect facts about system services] *******************************************************************************
ok: [localhost]

TASK [Firewall enable tftp and httpd] ************************************************************************************
ok: [localhost] => (item=tftp)
ok: [localhost] => (item=http)

TASK [Build python prereqs for Ansible (WARNING: very long task on first execution!)] ************************************
changed: [localhost]

TASK [DHCP configuration prefix] *****************************************************************************************
fatal: [localhost]: FAILED! => {"changed": false, "msg": "Path /etc/dhcp/dhcpd.conf does not exist !", "rc": 257}

PLAY RECAP ***************************************************************************************************************
localhost                  : ok=11   changed=2    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

[ansible@tfv-temp ocp-ppc-install]$ touch /etc/dhcp/dhcpd.conf
touch: cannot touch '/etc/dhcp/dhcpd.conf': Permission denied
[ansible@tfv-temp ocp-ppc-install]$ sudo touch /etc/dhcp/dhcpd.conf
[ansible@tfv-temp ocp-ppc-install]$ ansible-playbook install_ocp.yml

PLAY [Store known hosts of all HMCs] *************************************************************************************

TASK [Gathering Facts] ***************************************************************************************************
ok: [localhost]

TASK [Detect HMC IPs] ****************************************************************************************************
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-boot', 'value': {'ip': '172.17.227.61', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-m1', 'value': {'ip': '172.17.227.62', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-m2', 'value': {'ip': '172.17.227.63', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-m3', 'value': {'ip': '172.17.227.64', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-w1', 'value': {'ip': '172.17.227.65', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})
ok: [localhost] => (item={'key': 'TFV-OCPTEMP-w2', 'value': {'ip': '172.17.227.66', 'hmc': 'vhmc-p901', 'managed_system': 'L922-seg'}})

TASK [Scan ssh public keys of HMC] ***************************************************************************************
changed: [localhost] => (item=vhmc-p901)

TASK [Collect all SSH keys] **********************************************************************************************
ok: [localhost] => (item={'changed': True, 'stdout': '172.17.251.91 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRvu/cT7CEFr+OMssg2Igr/nlSxukdN7S8VZ45mtgeOGETk1Cnex0RT8tyssVZOk9LP+89kPkDA1DR7avF8kfuqDe6DBlBhIO7MZk+SJW5beDQwmjnJHghxxlJI5WK7+gUwzRhdf4fc5Hte0ghhbcVsRLJlcZNQNoNj6+dewN0gYwIYnzJ3Jr1ryA7fq7Uq3+zzclryVFblm/RiZeuSXqmUDed6IndchRXYrjhbWUF35tc/s6YT+n0hK0cZikebq6vSMyi/qjZ16oosoYMHbSnfoTNwOwUlvmg1BH2eTAI6IF+ppAp4pUNGSJ6BF8sfmMi5CB+/TCIMlzVmgW4kNayyDY2m0amwfs8vwfHHobwxDW8pcpuHg6HXhdETRYtdcjTvcPciOojp32cQZojSWfmnMh4Gu4bGFdZfwlme2m/knhzAp2RuKzVwOHYrSVuy4x7nriBk2BGQrZGURRcJGjWZgvQkOZuQqMEV4cSm2h5h0lWbaskC5juMlfgYHm9+pk=\n172.17.251.91 ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFETg9vxcTrPro9nj1xpTeNaqm9JrggRTgeokTwmuUUQIxUlzvDPGjcTfgngJJWVmUTz5OgqUCBS6ulY+sFmqPQogA4/ozt0EvS3zIGGloTyMSZ1NgzbAfwg5mJRHSpKiYKqzawA9c1q/SDug5ie+nQtXXlhMb4S2gXq5xXaDhkOwrxcw==\n172.17.251.91 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEy4+G8KhdrzIJ/0Rb7FltYhpXNEahZJTEkKN42D/c6a', 'stderr': '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0\n# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0\n# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0\n# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0\n# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', 'rc': 0, 'cmd': 'ssh-keyscan 172.17.251.91', 'start': '2024-09-03 15:45:38.721095', 'end': '2024-09-03 15:45:38.788607', 'delta': '0:00:00.067512', 'msg': '', 'invocation': {'module_args': {'_raw_params': 'ssh-keyscan 172.17.251.91', '_uses_shell': True, 'stdin_add_newline': True, 'strip_empty_ends': True, 'argv': None, 'chdir': None, 'executable': None, 'creates': None, 'removes': None, 'stdin': None}}, 'stdout_lines': ['172.17.251.91 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRvu/cT7CEFr+OMssg2Igr/nlSxukdN7S8VZ45mtgeOGETk1Cnex0RT8tyssVZOk9LP+89kPkDA1DR7avF8kfuqDe6DBlBhIO7MZk+SJW5beDQwmjnJHghxxlJI5WK7+gUwzRhdf4fc5Hte0ghhbcVsRLJlcZNQNoNj6+dewN0gYwIYnzJ3Jr1ryA7fq7Uq3+zzclryVFblm/RiZeuSXqmUDed6IndchRXYrjhbWUF35tc/s6YT+n0hK0cZikebq6vSMyi/qjZ16oosoYMHbSnfoTNwOwUlvmg1BH2eTAI6IF+ppAp4pUNGSJ6BF8sfmMi5CB+/TCIMlzVmgW4kNayyDY2m0amwfs8vwfHHobwxDW8pcpuHg6HXhdETRYtdcjTvcPciOojp32cQZojSWfmnMh4Gu4bGFdZfwlme2m/knhzAp2RuKzVwOHYrSVuy4x7nriBk2BGQrZGURRcJGjWZgvQkOZuQqMEV4cSm2h5h0lWbaskC5juMlfgYHm9+pk=', '172.17.251.91 ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFETg9vxcTrPro9nj1xpTeNaqm9JrggRTgeokTwmuUUQIxUlzvDPGjcTfgngJJWVmUTz5OgqUCBS6ulY+sFmqPQogA4/ozt0EvS3zIGGloTyMSZ1NgzbAfwg5mJRHSpKiYKqzawA9c1q/SDug5ie+nQtXXlhMb4S2gXq5xXaDhkOwrxcw==', '172.17.251.91 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEy4+G8KhdrzIJ/0Rb7FltYhpXNEahZJTEkKN42D/c6a'], 'stderr_lines': ['# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0', '# 172.17.251.91:22 SSH-2.0-OpenSSH_8.0'], 'failed': False, 'item': 'vhmc-p901', 'ansible_loop_var': 'item'})

TASK [Make sure that .ssh exists in /home/ansible] ***********************************************************************
ok: [localhost]

TASK [Update known hosts for HMC] ****************************************************************************************
ok: [localhost] => (item=172.17.251.91 ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRvu/cT7CEFr+OMssg2Igr/nlSxukdN7S8VZ45mtgeOGETk1Cnex0RT8tyssVZOk9LP+89kPkDA1DR7avF8kfuqDe6DBlBhIO7MZk+SJW5beDQwmjnJHghxxlJI5WK7+gUwzRhdf4fc5Hte0ghhbcVsRLJlcZNQNoNj6+dewN0gYwIYnzJ3Jr1ryA7fq7Uq3+zzclryVFblm/RiZeuSXqmUDed6IndchRXYrjhbWUF35tc/s6YT+n0hK0cZikebq6vSMyi/qjZ16oosoYMHbSnfoTNwOwUlvmg1BH2eTAI6IF+ppAp4pUNGSJ6BF8sfmMi5CB+/TCIMlzVmgW4kNayyDY2m0amwfs8vwfHHobwxDW8pcpuHg6HXhdETRYtdcjTvcPciOojp32cQZojSWfmnMh4Gu4bGFdZfwlme2m/knhzAp2RuKzVwOHYrSVuy4x7nriBk2BGQrZGURRcJGjWZgvQkOZuQqMEV4cSm2h5h0lWbaskC5juMlfgYHm9+pk=)
ok: [localhost] => (item=172.17.251.91 ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFETg9vxcTrPro9nj1xpTeNaqm9JrggRTgeokTwmuUUQIxUlzvDPGjcTfgngJJWVmUTz5OgqUCBS6ulY+sFmqPQogA4/ozt0EvS3zIGGloTyMSZ1NgzbAfwg5mJRHSpKiYKqzawA9c1q/SDug5ie+nQtXXlhMb4S2gXq5xXaDhkOwrxcw==)
ok: [localhost] => (item=172.17.251.91 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEy4+G8KhdrzIJ/0Rb7FltYhpXNEahZJTEkKN42D/c6a)

PLAY [Install services] **************************************************************************************************

TASK [Install EPEL] ******************************************************************************************************
ok: [localhost]

TASK [Install Linux packages] ********************************************************************************************
ok: [localhost]

TASK [Collect facts about system services] *******************************************************************************
ok: [localhost]

TASK [Firewall enable tftp and httpd] ************************************************************************************
ok: [localhost] => (item=tftp)
ok: [localhost] => (item=http)

TASK [Build python prereqs for Ansible (WARNING: very long task on first execution!)] ************************************
changed: [localhost]

TASK [DHCP configuration prefix] *****************************************************************************************
changed: [localhost]

TASK [Prepare tftp boot structure] ***************************************************************************************
changed: [localhost]

TASK [Activate and enable tftp, http and dhcp] ***************************************************************************
ok: [localhost] => (item=tftp.socket)
ok: [localhost] => (item=httpd)
ok: [localhost] => (item=dhcpd)

PLAY [DNS check] *********************************************************************************************************

TASK [Defined names of all OCP nodes] ************************************************************************************
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'}) => {
    "msg": "tfv-ocptemp-boot"
}
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'}) => {
    "msg": "tfv-ocptemp-m1"
}
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'}) => {
    "msg": "tfv-ocptemp-m2"
}
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'}) => {
    "msg": "tfv-ocptemp-m3"
}
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'}) => {
    "msg": "tfv-ocptemp-w1"
}
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'}) => {
    "msg": "tfv-ocptemp-w2"
}

TASK [Check DNS names] ***************************************************************************************************
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'})
skipping: [localhost]

TASK [Check DNS reverse resolution] **************************************************************************************
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'})
skipping: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'})
skipping: [localhost]

TASK [Check DNS "api.ocptest.power.seg.it.ibm.com"] **********************************************************************
skipping: [localhost]

TASK [Check DNS "api-int.ocptest.power.seg.it.ibm.com"] ******************************************************************
skipping: [localhost]

TASK [Check DNS "*.apps.ocptest.power.seg.it.ibm.com"] *******************************************************************
skipping: [localhost]

TASK [Show reverse resolution] *******************************************************************************************
ok: [localhost] => {
    "msg": [
        "Balancer should have a reverse resolution but it is not mandatory",
        "Balancer currently is 172.17.227.67 and resolves to tfv-ocptemp-haproxy.power.seg.it.ibm.com.,api.ocptest.power.seg.it.ibm.com.,api-int.ocptest.power.seg.it.ibm.com."
    ]
}

PLAY [Collect MAC address from LPAR] *************************************************************************************

TASK [Boot LPARs for MAC discovery] **************************************************************************************
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'})

TASK [Register MAC address] **********************************************************************************************
ok: [localhost] => (item={'changed': True, 'command_output': ['# Connecting to TFV-OCPTEMP-boot.', '# Connected', '# Checking for power off.', '# Power off the node.', '# Wait for power off.', '# Power off complete.', '# Power on TFV-OCPTEMP-boot to Open Firmware.', '# Power on complete.', '# Getting adapter location codes.', '# Type\t Location Code\t MAC Address\t Full Path Name\t Ping Result\t Device Type', 'ent U9008.22L.7878B8A-V17-C2-T1 c2df9f394b02 /vdevice/l-lan@30000002 n/a virtual'], 'invocation': {'module_args': {'hmc_host': '172.17.251.91', 'hmc_auth': {'username': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER', 'password': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER'}, 'cmd': 'lpar_netboot -M -n -f -t ent TFV-OCPTEMP-boot default_profile L922-seg\n'}}, 'failed': False, 'item': {'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'}, 'ansible_loop_var': 'item'})
ok: [localhost] => (item={'changed': True, 'command_output': ['# Connecting to TFV-OCPTEMP-m1.', '# Connected', '# Checking for power off.', '# Power off the node.', '# Wait for power off.', '# Power off complete.', '# Power on TFV-OCPTEMP-m1 to Open Firmware.', '# Power on complete.', '# Getting adapter location codes.', '# Type\t Location Code\t MAC Address\t Full Path Name\t Ping Result\t Device Type', 'ent U9008.22L.7878B8A-V18-C2-T1 c2df9b276e02 /vdevice/l-lan@30000002 n/a virtual'], 'invocation': {'module_args': {'hmc_host': '172.17.251.91', 'hmc_auth': {'username': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER', 'password': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER'}, 'cmd': 'lpar_netboot -M -n -f -t ent TFV-OCPTEMP-m1 default_profile L922-seg\n'}}, 'failed': False, 'item': {'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'}, 'ansible_loop_var': 'item'})
ok: [localhost] => (item={'changed': True, 'command_output': ['# Connecting to TFV-OCPTEMP-m2.', '# Connected', '# Checking for power off.', '# Power off the node.', '# Wait for power off.', '# Power off complete.', '# Power on TFV-OCPTEMP-m2 to Open Firmware.', '# Power on complete.', '# Getting adapter location codes.', '# Type\t Location Code\t MAC Address\t Full Path Name\t Ping Result\t Device Type', 'ent U9008.22L.7878B8A-V19-C2-T1 c2df9e809a02 /vdevice/l-lan@30000002 n/a virtual'], 'invocation': {'module_args': {'hmc_host': '172.17.251.91', 'hmc_auth': {'username': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER', 'password': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER'}, 'cmd': 'lpar_netboot -M -n -f -t ent TFV-OCPTEMP-m2 default_profile L922-seg\n'}}, 'failed': False, 'item': {'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'}, 'ansible_loop_var': 'item'})
ok: [localhost] => (item={'changed': True, 'command_output': ['# Connecting to TFV-OCPTEMP-m3.', '# Connected', '# Checking for power off.', '# Power off the node.', '# Wait for power off.', '# Power off complete.', '# Power on TFV-OCPTEMP-m3 to Open Firmware.', '# Power on complete.', '# Getting adapter location codes.', '# Type\t Location Code\t MAC Address\t Full Path Name\t Ping Result\t Device Type', 'ent U9008.22L.7878B8A-V20-C2-T1 c2df922dd302 /vdevice/l-lan@30000002 n/a virtual'], 'invocation': {'module_args': {'hmc_host': '172.17.251.91', 'hmc_auth': {'username': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER', 'password': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER'}, 'cmd': 'lpar_netboot -M -n -f -t ent TFV-OCPTEMP-m3 default_profile L922-seg\n'}}, 'failed': False, 'item': {'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'}, 'ansible_loop_var': 'item'})
ok: [localhost] => (item={'changed': True, 'command_output': ['# Connecting to TFV-OCPTEMP-w1.', '# Connected', '# Checking for power off.', '# Power off the node.', '# Wait for power off.', '# Power off complete.', '# Power on TFV-OCPTEMP-w1 to Open Firmware.', '# Power on complete.', '# Getting adapter location codes.', '# Type\t Location Code\t MAC Address\t Full Path Name\t Ping Result\t Device Type', 'ent U9008.22L.7878B8A-V22-C2-T1 c2df9dbf7202 /vdevice/l-lan@30000002 n/a virtual'], 'invocation': {'module_args': {'hmc_host': '172.17.251.91', 'hmc_auth': {'username': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER', 'password': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER'}, 'cmd': 'lpar_netboot -M -n -f -t ent TFV-OCPTEMP-w1 default_profile L922-seg\n'}}, 'failed': False, 'item': {'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'}, 'ansible_loop_var': 'item'})
ok: [localhost] => (item={'changed': True, 'command_output': ['# Connecting to TFV-OCPTEMP-w2.', '# Connected', '# Checking for power off.', '# Power off the node.', '# Wait for power off.', '# Power off complete.', '# Power on TFV-OCPTEMP-w2 to Open Firmware.', '# Power on complete.', '# Getting adapter location codes.', '# Type\t Location Code\t MAC Address\t Full Path Name\t Ping Result\t Device Type', 'ent U9008.22L.7878B8A-V23-C2-T1 c2df90485902 /vdevice/l-lan@30000002 n/a virtual'], 'invocation': {'module_args': {'hmc_host': '172.17.251.91', 'hmc_auth': {'username': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER', 'password': 'VALUE_SPECIFIED_IN_NO_LOG_PARAMETER'}, 'cmd': 'lpar_netboot -M -n -f -t ent TFV-OCPTEMP-w2 default_profile L922-seg\n'}}, 'failed': False, 'item': {'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'}, 'ansible_loop_var': 'item'})

TASK [Show MAC addresses] ************************************************************************************************
ok: [localhost] => {
    "msg": {
        "TFV-OCPTEMP-boot": "c2:df:9f:39:4b:02",
        "TFV-OCPTEMP-m1": "c2:df:9b:27:6e:02",
        "TFV-OCPTEMP-m2": "c2:df:9e:80:9a:02",
        "TFV-OCPTEMP-m3": "c2:df:92:2d:d3:02",
        "TFV-OCPTEMP-w1": "c2:df:9d:bf:72:02",
        "TFV-OCPTEMP-w2": "c2:df:90:48:59:02"
    }
}

PLAY [Download data from web] ********************************************************************************************

TASK [Detect proxy configuration] ****************************************************************************************
skipping: [localhost]

TASK [Create ocp directory for binaries] *********************************************************************************
ok: [localhost]

TASK [Download OpenShift installer] **************************************************************************************
ok: [localhost]

TASK [Create image directory] ********************************************************************************************
ok: [localhost]

TASK [Download boot images] **********************************************************************************************
ok: [localhost] => (item=https://mirror.openshift.com/pub/openshift-v4/ppc64le/dependencies/rhcos/latest/rhcos-live-kernel-ppc64le)
ok: [localhost] => (item=https://mirror.openshift.com/pub/openshift-v4/ppc64le/dependencies/rhcos/latest/rhcos-live-initramfs.ppc64le.img)

TASK [Create image directory] ********************************************************************************************
ok: [localhost]

TASK [Download RHCOS root filesystem] ************************************************************************************
ok: [localhost]

PLAY [Setup DHCP, TFTP and GRUB] *****************************************************************************************

TASK [Setup DHCP on control node] ****************************************************************************************
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'})

TASK [Restart DHCP] ******************************************************************************************************
changed: [localhost]

TASK [Setup tftpboot Grub] ***********************************************************************************************
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'})
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'})
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'})
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'})
ok: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'})

PLAY [Setup OCP installation] ********************************************************************************************

TASK [Clean directory for OCP data (../OCP_DATA/ocptest)] ****************************************************************
changed: [localhost]

TASK [Create directory for OCP data (../OCP_DATA/ocptest)] ***************************************************************
changed: [localhost]

TASK [Create SSH key pair for OCP] ***************************************************************************************
changed: [localhost]

TASK [Read public key] ***************************************************************************************************
ok: [localhost]

TASK [Create setup directory] ********************************************************************************************
changed: [localhost]

TASK [Load pull secret] **************************************************************************************************
ok: [localhost]

TASK [Unpack OpenShift installer] ****************************************************************************************
ok: [localhost]

TASK [Create install-config.yaml] ****************************************************************************************
changed: [localhost]

TASK [Make a install-config.yaml backup] *********************************************************************************
changed: [localhost]

TASK [Create manifests] **************************************************************************************************
changed: [localhost]

TASK [Make masters not schedulable] **************************************************************************************
changed: [localhost]

TASK [Enable multipath on masters] ***************************************************************************************
changed: [localhost]

TASK [Enable multipath on workers] ***************************************************************************************
changed: [localhost]

TASK [Use custom YAML files in ocp_custom_yaml directory] ****************************************************************
changed: [localhost]

TASK [Remove setup-backup directory] *************************************************************************************
ok: [localhost]

TASK [Make a backup of setup directory before ignition generation] *******************************************************
changed: [localhost]

TASK [Create ignition configs (consumes content of ../OCP_DATA/ocptest/setup directory)] *********************************
changed: [localhost]

TASK [Create butane file for disk boot] **********************************************************************************
changed: [localhost]

TASK [Create ignition file for disk boot] ********************************************************************************
changed: [localhost]

PLAY [Setup Web server] **************************************************************************************************

TASK [Copy bootnode ignition] ********************************************************************************************
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})

TASK [Copy master ignition] **********************************************************************************************
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'})

TASK [Copy worker ignition] **********************************************************************************************
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'})

TASK [Copy sda boot ignition] ********************************************************************************************
ok: [localhost]

PLAY [Start installation] ************************************************************************************************

TASK [Boot all LPARs and start network installation] *********************************************************************
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'})

TASK [Show next steps] ***************************************************************************************************
ok: [localhost] => {
    "msg": [
        "Master node installation has started.",
        "Workers will wait for master nodes' full setup",
        "Monitor master nodes installation with the following command:",
        "ocp/openshift-install --dir OCP_DATA/ocptest/setup wait-for bootstrap-complete --log-level=info"
    ]
}

TASK [Wait for bootsrap to complete (see comment on previous step, normally it takes around 30 minutes)] *****************
changed: [localhost]

TASK [Poll for bootstrap completion every 5 minutes] *********************************************************************
FAILED - RETRYING: [localhost]: Poll for bootstrap completion every 5 minutes (24 retries left).
FAILED - RETRYING: [localhost]: Poll for bootstrap completion every 5 minutes (23 retries left).
FAILED - RETRYING: [localhost]: Poll for bootstrap completion every 5 minutes (22 retries left).
FAILED - RETRYING: [localhost]: Poll for bootstrap completion every 5 minutes (21 retries left).
FAILED - RETRYING: [localhost]: Poll for bootstrap completion every 5 minutes (20 retries left).
FAILED - RETRYING: [localhost]: Poll for bootstrap completion every 5 minutes (19 retries left).
FAILED - RETRYING: [localhost]: Poll for bootstrap completion every 5 minutes (18 retries left).
FAILED - RETRYING: [localhost]: Poll for bootstrap completion every 5 minutes (17 retries left).
changed: [localhost]

TASK [Bootsrap completed. Bootstrap node may be powered off.] ************************************************************
ok: [localhost] => {
    "msg": [
        "Started: 2024-09-03 15:55:45.027879",
        "Ended  : 2024-09-03 16:31:48.508631"
    ]
}

TASK [Software installation has been fully started] **********************************************************************
ok: [localhost] => {
    "msg": [
        "All nodes has been activated and installation has been started",
        "Wait for master nodes to be Ready: oc get nodes",
        "Remember to set KUBECONFIG shell variable to OCP_DATA/ocptest/setup/auth/kubeconfig",
        "Workers will ask to join the cluster",
        "Next steps will monitor worker nodes and accept them into the cluster"
    ]
}

PLAY [Accept workers into cluster] ***************************************************************************************

TASK [Include tasks] *****************************************************************************************************
included: /home/ansible/ocp-ppc-install/include/tasks_setup_worker.yml for localhost

TASK [Increment attempt counter] *****************************************************************************************
ok: [localhost]

TASK [Accept pending CSRs] ***********************************************************************************************
changed: [localhost]

TASK [Get running workers] ***********************************************************************************************
changed: [localhost]

TASK [Check completion - IT WILL FAIL AND WILL BE RETRIED MULTIPLE TIMES] ************************************************
fatal: [localhost]: FAILED! => {"changed": false, "cmd": "[ 0 -eq 2 ]", "delta": "0:00:00.003267", "end": "2024-09-03 16:35:59.224574", "msg": "non-zero return code", "rc": 1, "start": "2024-09-03 16:35:59.221307", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}

TASK [Attempt: 1/24. Ready workers: 0/2] *********************************************************************************
skipping: [localhost]

TASK [Delay 300 seconds] *************************************************************************************************
ok: [localhost]

TASK [include_tasks] *****************************************************************************************************
included: /home/ansible/ocp-ppc-install/include/tasks_setup_worker.yml for localhost

TASK [Increment attempt counter] *****************************************************************************************
ok: [localhost]

TASK [Accept pending CSRs] ***********************************************************************************************
changed: [localhost]

TASK [Get running workers] ***********************************************************************************************
changed: [localhost]

TASK [Check completion - IT WILL FAIL AND WILL BE RETRIED MULTIPLE TIMES] ************************************************
fatal: [localhost]: FAILED! => {"changed": false, "cmd": "[ 0 -eq 2 ]", "delta": "0:00:00.003134", "end": "2024-09-03 16:41:01.415172", "msg": "non-zero return code", "rc": 1, "start": "2024-09-03 16:41:01.412038", "stderr": "", "stderr_lines": [], "stdout": "", "stdout_lines": []}

TASK [Attempt: 2/24. Ready workers: 0/2] *********************************************************************************
skipping: [localhost]

TASK [Delay 300 seconds] *************************************************************************************************
ok: [localhost]

TASK [include_tasks] *****************************************************************************************************
included: /home/ansible/ocp-ppc-install/include/tasks_setup_worker.yml for localhost

TASK [Increment attempt counter] *****************************************************************************************
ok: [localhost]

TASK [Accept pending CSRs] ***********************************************************************************************
changed: [localhost]

TASK [Get running workers] ***********************************************************************************************
changed: [localhost]

TASK [Check completion - IT WILL FAIL AND WILL BE RETRIED MULTIPLE TIMES] ************************************************
ok: [localhost]

TASK [Get running workers] ***********************************************************************************************
changed: [localhost]

TASK [Task completed] ****************************************************************************************************
ok: [localhost] => {
    "msg": [
        "Ready workers: 2/2",
        "Cluster operators start deployment on available workers",
        "Monitor tasks with: oc get co",
        "Remember to set KUBECONFIG shell variable to OCP_DATA/ocptest/setup/auth/kubeconfig",
        "Console will be available when all cluster operators will be ready",
        "Console URL will be https://console-openshift-console.apps.ocptest.power.seg.it.ibm.com"
    ]
}

PLAY [Clean DHCP entry] **************************************************************************************************

TASK [Remove LPAR data from DHCP configuration file] *********************************************************************
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-boot', 'hostname': 'tfv-ocptemp-boot'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m1', 'hostname': 'tfv-ocptemp-m1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m2', 'hostname': 'tfv-ocptemp-m2'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-m3', 'hostname': 'tfv-ocptemp-m3'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w1', 'hostname': 'tfv-ocptemp-w1'})
changed: [localhost] => (item={'lpar_name': 'TFV-OCPTEMP-w2', 'hostname': 'tfv-ocptemp-w2'})

TASK [Restart DHCP] ******************************************************************************************************
changed: [localhost]

PLAY RECAP ***************************************************************************************************************
localhost                  : ok=76   changed=37   unreachable=0    failed=0    skipped=8    rescued=2    ignored=0

[ansible@tfv-temp ocp-ppc-install]$

