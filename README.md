# AWS-EC2-Instance-with-Packer-and-Ansible

A project using packer to build an image and ansible for configuration management

## How to Setup the application on your machine

- Create an account on [AWS](https://aws.amazon.com/), if you don't have one
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
## How to Create an Instance with the AMI(Automated Machine Image) Created
- After successfully running the command, go to your dashboard on aws, select **Services**, under services, select **EC2**, which is under compute, under the EC2 dashboard, select **AMI's**, you will see the the AMI that was just being created

1. Select the image, and click on launch
<img width="1224" alt="Screenshot 2019-04-27 at 8 03 59 PM" src="https://user-images.githubusercontent.com/6943256/56854080-ec905100-6928-11e9-8cb1-21a6073cb54f.png">

2. Select an instance type
<img width="1423" alt="Screenshot 2019-04-27 at 8 18 21 PM" src="https://user-images.githubusercontent.com/6943256/56854126-a8518080-6929-11e9-87ae-bc339b707ea0.png">

3. Configure the instance details
<img width="1424" alt="Screenshot 2019-04-27 at 8 20 47 PM" src="https://user-images.githubusercontent.com/6943256/56854150-0b431780-692a-11e9-9b6c-091d2fdd0da9.png">

4. Add storage for the instance
<img width="1413" alt="Screenshot 2019-04-27 at 8 24 14 PM" src="https://user-images.githubusercontent.com/6943256/56854366-354a0900-692d-11e9-91ec-c6fdd67bf806.png">

5. Add tags by clicking on the add tag button
<img width="1431" alt="Screenshot 2019-04-27 at 8 44 47 PM" src="https://user-images.githubusercontent.com/6943256/56854375-64607a80-692d-11e9-8979-dfee642b4443.png">

6. Configure the security group by selecting `create a new security group`, or select `existing security group`
<img width="1425" alt="Screenshot 2019-04-27 at 8 47 05 PM" src="https://user-images.githubusercontent.com/6943256/56854431-54956600-692e-11e9-9b2e-a9462558b391.png">

- Click on the Add rule, and select the `type`, add the `port range`, **ensure you add your appplication port**, so you can access it via the browser
7. Review the instance, ensure you supplied the right details
<img width="1422" alt="Screenshot 2019-04-27 at 8 56 11 PM" src="https://user-images.githubusercontent.com/6943256/56854520-e9e52a00-692f-11e9-9ea2-4b015578eaa7.png">

Now we are almost done 😌
<img width="696" alt="Screenshot 2019-04-27 at 9 04 21 PM" src="https://user-images.githubusercontent.com/6943256/56854538-29137b00-6930-11e9-99b2-2ee3b29b7d7d.png">

 - Create a key-value pair by selecting `create new key-pair`, enter the `key-pair` name, and download the `key-pair` to your machine if you don't have one, so you can get RSA Key that will enable you SSH into the instance or select `choose existing key-pair` in the dropdown if you have already created one, you can also proceed without a key pair, click on the **launch instance** button, this will take about 2mins for the instance to be ready
- After the instance is created, select the instances on the **EC2 dashboard** 
- Select the instance that you just created 
<img width="473" alt="Screenshot 2019-04-27 at 9 12 02 PM" src="https://user-images.githubusercontent.com/6943256/56854611-3aa95280-6931-11e9-9920-f82e5bde7fec.png">

- Scroll to the bottom of the page, by the bottom right, you will see the public IP address e.g ```3.16.154.225```
<img width="1058" alt="Screenshot 2019-04-27 at 9 13 40 PM" src="https://user-images.githubusercontent.com/6943256/56854620-5f9dc580-6931-11e9-8581-5fb05bcb2f69.png">

- Go to the terminal and ssh into the instance by running the command ```ssh -i demo-packer.pem.txt ubuntu@3.16.154.225```, `demo-packer.pem.txt` representing where the key is store.
- Now you can access the application via the IP `3.16.154.225`

## Built With
- [Packer](https://www.packer.io/)
- [Ansible](https://www.ansible.com/) - Configuration management tool

## Authors

- Abejide Femi

## Acknowledgments

- Marcus
- Idrees Ibrahim
