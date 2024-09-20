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
   Resources created includes: vpc, subnet and internet gateway. <br/>
          
   <img src='./sst/s3.png' height="80%" width="80%" alt="Disk Sanitization Steps">



   The internet gateway is associated with the default route table and configure to allow connection if vpc to internet 
   <img src='./sst/s4.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   values are parameterized and listed in the variables.tf file. This makes the configuration file reuseable
   <img src='./sst/s2.png' height="80%" width="80%" alt="Disk Sanitization Steps">

   the values of the variable are listed in the terraform.tfvars file
   <img src='./sst/s1.png' height="80%" width="80%" alt="Disk Sanitization Steps">

         terraform init: 
   <img src='./sst/s6.png' height="80%" width="80%" alt="Disk Sanitization Steps">
   <img src='./sst/s7.png' height="80%" width="80%" alt="Disk Sanitization Steps">
   <img src='./sst/s8.png' height="80%" width="80%" alt="Disk Sanitization Steps">
   <img src='./sst/s9.png' height="80%" width="80%" alt="Disk Sanitization Steps">


   

 

   
   
   

 


   <h2>step 2  </h2>


    
  



  

   <h2>step 3 </h2>



  

 
   
   

   <h2>step 4 
  
   

   


  

   

 
     

</p>
