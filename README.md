# Infrastructure as Code (IaC)

- [Infrastructure as Code (IaC)](#infrastructure-as-code-iac)
- [What is IaC?](#what-is-iac)
  - [Benefits of IaC](#benefits-of-iac)
    - [Detailed Benefits of IaC](#detailed-benefits-of-iac)
    - [Key Benefits of IaC and CI/CD for Customers](#key-benefits-of-iac-and-cicd-for-customers)
  - [When/Where to Use IaC](#whenwhere-to-use-iac)
  - [What are the Tools Available for IaC?](#what-are-the-tools-available-for-iac)
- [What is Configuration Management (CM)?](#what-is-configuration-management-cm)
- [What is Provisioning of Infrastructure? Do CM Tools Do It?](#what-is-provisioning-of-infrastructure-do-cm-tools-do-it)
- [What is Ansible and How Does It Work?](#what-is-ansible-and-how-does-it-work)
- [Who is Using IaC and Ansible in the Industry?](#who-is-using-iac-and-ansible-in-the-industry)


![iac1](./iac-images/iac1.png)
Source: https://www.linkedin.com/pulse/enabling-infrastructure-code-iac-cicd-key-benefits-customers-bilal/


# What is IaC?
* Infrastructure as Code (IaC) is a way to **manage and provision computer data centers through machine-readable definition files**, rather than physical hardware configuration or interactive configuration tools. 
* With IaC, organisations can define their infrastructure in a text file, which can be version controlled and deployed automatically using tools like Terraform, Ansible, and Chef
  
> Think of it like writing code to set up and manage your servers, networks, and other infrastructure, instead of doing it manually.

![iac2](./iac-images/iac2.png)
Source: https://scand.com/company/blog/infrastructure-as-code/

<br>

## Benefits of IaC
* **Consistency**: Ensures that the same environment is created every time, reducing errors.
* ⏩🏃🏻‍♀️‍➡️**Speed**: Automates the setup process, making it much faster.
* 📈**Scalability**: Easily replicate environments across different locations.
* **Version Control**: Track changes and revert to previous configurations if needed.
* 💵🫰🏻**Cost Efficiency**: Reduces manual labor and potential downtime.

<br>

### Detailed Benefits of IaC
* **Version Control**: Infrastructure definitions can be version controlled, which provides traceability and accountability for infrastructure changes. 
  * Version control systems enable you to see who made the changes, when they made them, and what changes were made.
* **Reusability**: IaC enables organisations to reuse code for infrastructure components like servers, databases, and networks. 
  * This helps to reduce duplication of effort and increases efficiency.
* **Consistency**: Infrastructure definitions can be tested and validated before deployment, which ensures consistency in the environment. 
  * This helps to prevent issues caused by manual configuration errors.

<br>

### Key Benefits of IaC and CI/CD for Customers
* **Faster Time-to-Market**: IaC and CI/CD enable organisations to deploy changes quickly, which helps to reduce the time it takes to bring new features to market. 
  * This enables organisations to remain competitive and meet customer

* **Improved Quality**: IaC and CI/CD enable organisations to test changes automatically, which helps to identify issues early in the development process. 
  * Automated testing ensures that code changes meet the required quality standards before they are deployed to production. 
  * This reduces the risk of defects, security vulnerabilities, and performance issues.

* **Reduced Costs**: IaC and CI/CD help to reduce costs by automating repetitive tasks and reducing manual effort. 
  * This helps to minimise the time and effort required for infrastructure and software deployments. 
  * Automation also helps to reduce the risk of human error, which can lead to costly downtime and remediation efforts.

* **Increased Agility**: IaC and CI/CD enable organisations to be more agile by providing the ability to make changes quickly and efficiently. 
  * With IaC, infrastructure changes can be made in a matter of minutes or hours, compared to days or weeks with manual processes. 
  * This enables organisations to respond to market changes and customer feedback more quickly and efficiently.

<br>

## When/Where to Use IaC
IaC is useful whenever you need to **manage infrastructure**, especially in environments that require frequent updates or scaling. 

It’s commonly used in:
* **Cloud environments**: Automating the setup of cloud resources.
* **Development and testing**: Quickly setting up consistent environments for developers and testers.
* **Production**: Ensuring reliable and repeatable deployments.

<br>

## What are the Tools Available for IaC?
* **Terraform**: A widely-used tool that works with many cloud providers.
* **AWS CloudFormation**: A tool specific to Amazon Web Services.
* **Azure Resource Manager**: For managing resources in Microsoft Azure.
* **Google Cloud Deployment Manager**: For Google Cloud Platform.
* **Ansible**, **Chef**, **Puppet**: These tools also handle configuration management.

![10-iac-tools](./iac-images/iac-tools.png)
Source: https://cloudwithease.com/top-10-infrastructure-as-a-code-or-iac-tools/

<br>

# What is Configuration Management (CM)?
* Configuration Management (CM) is a process for **maintaining the consistency** of a product’s **performance**, **functional**, and **physical attributes** with its **requirements**, **design**, and **operational information** throughout its life. 
* It helps ensure that systems perform as expected and can be easily managed and updated.

<br>

# What is Provisioning of Infrastructure? Do CM Tools Do It?
* Provisioning of infrastructure involves **setting up the necessary hardware** and **software** to **support applications**. 
* This includes servers, storage, networking, and more. Some CM tools, like Ansible and Chef, can also handle provisioning by automating the setup of these resources.

<br>

# What is Ansible and How Does It Work?
* Ansible is an **open-source tool** used for **IT automation**, including **configuration management**, **application deployment**, and **task automation**. 
* It works by **connecting to your nodes** (servers, devices, etc.) and **pushing out small programs** called “Ansible modules” **to perform tasks**. 
  * These modules are executed over SSH, and the results are returned to the Ansible server.

<br>

# Who is Using IaC and Ansible in the Industry?
* **Tech giants** like Google, Amazon, and Microsoft for managing their vast cloud infrastructures.
* **Financial institutions** for ensuring secure and consistent environments.
* **Healthcare** providers for managing sensitive data and compliance.
* **Startups** for quickly scaling their infrastructure as they grow.

<br> 

