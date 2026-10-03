
<img width="1536" height="1024" alt="CloudOps Node js CI_CD Dashboard" src="https://github.com/user-attachments/assets/838967bf-a744-4910-b785-23a23372a547" />


# 🚀 CloudOps Node.js CI/CD Automation

An AWS-based CI/CD project that automates the deployment of a Node.js application from GitHub to Amazon EC2 using AWS CodePipeline, AWS Lambda, and AWS Systems Manager (SSM).

## 📌 Project Overview

This project demonstrates how to automate application deployment using AWS services. When code is pushed to GitHub, AWS CodePipeline triggers the deployment workflow. AWS Lambda sends commands through Systems Manager to an EC2 instance, where a Bash script pulls the latest code, installs dependencies, and restarts the Node.js application.

## 🏗️ Architecture

**GitHub → AWS CodePipeline → AWS Lambda → AWS Systems Manager (SSM) → Amazon EC2 → Node.js Application**

## ✨ Features

* Automated deployment triggered by GitHub changes.
* CI/CD orchestration using AWS CodePipeline.
* Server-side deployment commands using AWS Lambda and SSM.
* Automated code updates and dependency installation.
* Node.js application process restart using Bash scripting.
* IAM roles and permissions for AWS service access.
* REST endpoint for application health verification.

## 💻 Technologies Used

* 🐙 GitHub
* 🔄 AWS CodePipeline
* ⚡ AWS Lambda
* ⚙️ AWS Systems Manager (SSM)
* 🖥️ Amazon EC2
* 🔐 AWS IAM
* 📊 Amazon CloudWatch
* 🟢 Node.js
* ⚡ Express.js
* 📜 JavaScript
* 📦 npm
* 🔧 Git
* 🐧 Ubuntu Linux
* 🖥️ Bash Scripting

## 📁 Project Structure

```text
cloudops-nodejs-cicd/
│
├── app.js
├── package.json
├── package-lock.json
├── deploy.sh
├── .gitignore
└── README.md
```

## 🔄 CI/CD Deployment Flow

1. Developer pushes code to GitHub.
2. GitHub triggers AWS CodePipeline.
3. CodePipeline starts the deployment stage.
4. AWS Lambda receives the pipeline event.
5. Lambda sends a deployment command through AWS Systems Manager.
6. EC2 executes the `deploy.sh` script.
7. The script pulls the latest code from GitHub.
8. Production dependencies are installed.
9. The existing Node.js application process is restarted.
10. The updated application runs on port `3000`.

## ⚙️ Deployment Script

The `deploy.sh` script automates the application deployment process.

```bash
#!/bin/bash

APP_DIR="/var/www/cloudops-nodejs-cicd"

cd "$APP_DIR" || exit 1

git pull origin main
npm install --omit=dev

pkill -f "node app.js" || true

nohup npm start > app.log 2>&1 &
```

## 🌐 Application Endpoints

| Endpoint  | Purpose                           |
| --------- | --------------------------------- |
| `/`       | Displays the application message  |
| `/health` | Returns application health status |

**Health-check response:**

```json
{
  "status": "healthy",
  "message": "Application is working"
}
```

The application listens on port `3000`.

## 🧪 Testing

Run these commands on the EC2 instance or through AWS Systems Manager Session Manager:

```bash
cd /var/www/cloudops-nodejs-cicd

curl http://localhost:3000

curl http://localhost:3000/health
```

To check whether the application is listening on port 3000:

```bash
sudo ss -tlnp | grep :3000
```

## 🔐 Security

* IAM roles control access between AWS services.
* Systems Manager allows remote command execution without requiring SSH for deployment.
* EC2 security-group rules control network access to the application.
* AWS credentials should not be stored in source code.

For production use, restrict public access to the application port and use HTTPS through an appropriate load balancer or reverse proxy.

## 🎯 Learning Outcomes

* Understanding AWS CI/CD architecture.
* Automating deployments to EC2.
* Integrating Lambda with Systems Manager.
* Using Linux and Bash for deployment automation.
* Configuring IAM permissions for AWS services.
* Testing application availability through a health endpoint.

## 🔗 GitHub Repository

[View CloudOps Node.js CI/CD Automation](https://github.com/mohiterahul963-commits/cloudops-nodejs-cicd)

## 👨‍💻 Author

**Rahul Mohite**

Aspiring AWS Cloud Engineer
