#!/usr/bin/env bash

# Function to launch the instance
function launch_instance {
    packer build packer.json
    terraform init -input=false
    terraform plan
    terraform apply 
}

function main {
    launch_instance     
}
main
