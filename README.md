# AWS-EC2-Instance-with-Packer-and-Ansible

A project using packer to build an image and ansible for configuration management

## How to Setup the application

- Create an account on aws, if you don't have one
- Select Services from the menu bar and click on `IAM(Identity Access Management)` which is under Security, Identity, & Compliance
- Select User and add a user by entering the username, this will be enable to get an access and a secret key
- Ensure you have packer installed by running the command on the terminal 
```bash
$ packer -v
```
- Clone the github repository
- Copy the content of the .env.sample file(aws_access_key and aws_secret_key)
- Export the variables in the terminal by running the command 
```bash 
$ export aws_access_key=myaccesskey
``` 
and 
```bash 
$ export aws_secret_key=mysecretkey
```
- To confirm the variables are in the environment, run the command 
```bash 
$ env
```
it will display the variables
- Run the command 
```bash
$ packer validate packer.json
``` 
to validate the packer.json
- Run the command 
```bash 
$ packer build packer.json
``` 
to build the image, this will take a while to run, once this is successful, you will see the AMI name and id on the terminal
- After successfully running the command, go to your dashboard on aws, under images, check AMIs you will see the the image that was just being created
- Select the image, and launch it
- Select an instance type, `it is advisable to select the t2micro type`
- Configure the instance details
- Add storage for the instance
- Add tags 
- Configure the security group by selecting `existing security group` or `create a new security group`, when creating a security make sure you add your application port so you access your application on your browser
- Also create a key-value pair by selecting `create new key-pair`, enter the `key-pair` name, and download the `key-pair` if you don't have one, so you can get RSA Key that will enable you SSH into the instance or select `choose existing key-pair` in the dropdown if you have already created one, you can also proceed without a key pair
- After the instance is created, select the instance and scroll to the bottom of the page, by the bottom right, you will see the public IP address e.g ```3.16.154.225```
- Go to the terminal and ssh into the instance by running the command ```ssh -i demo-packer.pem.txt ubuntu@3.16.154.225```, demo-packer.pem.txt representing where the key is store.
- Now you can access the application via the IP `3.16.154.225`

## Built With

- [Packer](https://www.packer.io/)
- [Ansible](https://www.ansible.com/) - Configuration management tool

## Authors

- Abejide Femi

## Acknowledgments

- Marcus
- Idrees Ibrahim
