#!/bin/bash

## Set variables for script
ANSIBLE_DIR="ansible"
ANSIBLE_DIR_PATH="../$ANSIBLE_DIR"
ANSIBLE_INVENTORY_DIR="inventories"
ANSIBLE_INVENTORY_FILE="homelab/inventory.yml"
ANSIBLE_INVENTORY_GROUP="autoReboot"
ANSIBLE_PLAYBOOKS_DIR="plays"
ANSIBLE_PLAYBOOK_FILE="update-system.yml"

function build_ansible_cmd() {
    ## Build the command to run in Poetry

    inventory_path="$ANSIBLE_INVENTORY_DIR/$ANSIBLE_INVENTORY_FILE"
    ansible_cmd="ansible-playbook -i $inventory_path --limit $ANSIBLE_INVENTORY_GROUP $ANSIBLE_PLAYBOOKS_DIR/$ANSIBLE_PLAYBOOK_FILE"

    echo $ansible_cmd

}

function main() {
    ## Run ansible-playbook command to update all servers
    #  in the autoReboot group

    ## Get command
    _cmd=$(build_ansible_cmd)

    echo ""
    echo "Changing directory to $ANSIBLE_DIR_PATH"
    echo ""

    ## cd to the root Ansible directory
    cd $ANSIBLE_DIR_PATH

    echo ""
    echo "Running Ansible update play"
    echo "Command: $ $_cmd"
    echo ""

    ## Run ansible-playbook command in Poetry
    poetry run $_cmd
}

main
