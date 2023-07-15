all:
	ansible-playbook -b run.yaml --limit all --ask-become-pass --vault-password-file .vault_password --tags compose

connection:
	ansible -i hosts.ini -m ping all

ansible:
	ansible-playbook -b run.yaml --ask-become-pass --vault-password-file .vault_password

local:
	ansible-playbook -b run.yaml --limit local --ask-become-pass --vault-password-file .vault_password

b:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit blackhole --ask-become-pass --vault-password-file .vault_password

bcomp:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit blackhole --ask-become-pass --vault-password-file .vault_password --tags compose

bdoc:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit blackhole --ask-become-pass --vault-password-file .vault_password --tags doc-conf

bscript:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit blackhole --ask-become-pass --vault-password-file .vault_password --tags script

w:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit whitehole --ask-become-pass --vault-password-file .vault_password

wcomp:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit whitehole --ask-become-pass --vault-password-file .vault_password --tags compose

wdns:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit whitehole --ask-become-pass --vault-password-file .vault_password --tags pihole

h:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit homelab --ask-become-pass --vault-password-file .vault_password

hcomp:
	ansible-playbook -b run.yaml --inventory-file hosts.ini --limit homelab --ask-become-pass --vault-password-file .vault_password --tags compose

reqs:
	ansible-galaxy install -r requirements.yaml

forcereqs:
	ansible-galaxy install -r requirements.yaml --force

decrypt:
	ansible-vault decrypt --vault-password-file .vault_password vars/vault.yaml

encrypt:
	ansible-vault encrypt --vault-password-file .vault_password vars/vault.yaml

secret:
	make decrypt && cat vars/vault.yaml && make encrypt

change_secret:
	make decrypt && vim vars/vault.yaml && make encrypt
