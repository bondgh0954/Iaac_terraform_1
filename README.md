# Iaac_terraform_1


<h1>Automate AWS Infrastructure</h1>
<h2>Technologies used</h2>

- <b>terraform</b> 
- <b>AWS</b>
- <b>Docker</b>
- <b>Linux<b/>
- <b>Git<b/>




<h2>Detailed Description of Project </h2>
1.Create TF project to automate provisioning AWS Infrastructure and its components, such as: VPC,Subnet, Route Table,internet Gateway,securityGroup and EC2<br/>
2. Configure TF script to automate deploying docker container to EC2 instance<br/>







   <p align="">
   <h2>step 1  Create VPC </h2>
   Create a file in the code editor for providers <br/>
   Create main.tf file in the code editor  <br/>
   authenticate with AWS using AWS global credentials <br/>





   create aws resources in the main.tf file <br/>
   Resources created includes: vpc, subnet and internet gateway.
          
   <img src='./sst/s3.png' height="80%" width="80%" alt="Disk Sanitization Steps">



   The internet gateway is associated with the default route table <br/>
   This configuration allowa connection if vpc to internet 
   <img src='./sst/s4.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   values are parameterized and listed in the variables.tf file. This makes the configuration file reuseable
   <img src='./sst/s2.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   the values of the variable are listed in the terraform.tfvars file
   <img src='./sst/s1.png' height="80%" width="80%" alt="Disk Sanitization Steps">

         terraform init: 
   <img src='./sst/s6.png' height="80%" width="80%" alt="Disk Sanitization Steps">

        terraform plan:
   <img src='./sst/s7.png' height="80%" width="80%" alt="Disk Sanitization Steps">

       terraform apply
   <img src='./sst/s8.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   Vpc, subnet, internet gateway and default route table have been created
   <img src='./sst/s9.png' height="80%" width="80%" alt="Disk Sanitization Steps">


   

 

   
   
   

 


   <h2>step 2  Creation of Security group and instance</h2>
    Creation of security group: port 22 is configured to allow only my ip address to ssh into the instance <br/>
    port 8080 is opened to allow all traffic from the internet because the application is run on that port 

   <img src='./sst/s12.png' height="80%" width="80%" alt="Disk Sanitization Steps">


   configuration is made to allow accessing ami id dynamically without hard coding

   <img src='./sst/s13.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   Key pair associated with the created instance is created using my public key so with the corresponding private key i can ssh into the server

   <img src='./sst/s14.png' height="80%" width="80%" alt="Disk Sanitization Steps">

    Creation of instance
   <img src='./sst/s15.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   The script is passed to user data to automatically install docker and run jenkins on port 8080 upon creation of the instance
   <img src='./sst/s11.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   Able to ssh into the created instance with the public and private key <br/>
   docker was installed and Jenkins container started successfully
   <img src='./sst/s18.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   Jenkins running on specified port 8080 on the instance
   <img src='./sst/s19.png' height="80%" width="80%" alt="Disk Sanitization Steps">


    
  



  





  

 
   
   

  
  
   

   


  

   

 
     

</p>
