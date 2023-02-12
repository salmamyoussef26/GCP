# GCP
# Task requirements:
- Build GCP infrastructure using Teraaform.
- Create Dockerfile of the application.
- Build the Dockerfile and push its image to GCR.
- Create .yaml files to deploy the app on private GKE cluster.
------------------------------------
# Tools:
1. GCP.
2. Terraform.
3. Docker.
4. K8s.
--------------------------------------
**1. Build GCP infrastructure using Terraform:**
```
.
├── firewall
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
├── gke
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
├── main.tf
├── nat_gateway
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
├── README.md
├── service_account
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
├── subnet
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
├── terraform.tfstate
├── terraform.tfstate.backup
├── vm
│   ├── main.tf
│   ├── output.tf
│   └── variables.tf
└── vpc
    ├── main.tf
    ├── output.tf
    └── variables.tf
```
-------------------------------------------
**2. Dockerfile:**

![Screenshot from 2023-02-13 01-17-06](https://user-images.githubusercontent.com/110994084/218343229-3f0a7253-d05b-4f35-b5d3-fb7ef37ca5e4.png)

Build and Push the image to GCR:
```
docker build -t final_task_app .
docker tag final_task_app gcr.io/salma-youssef-project/gcr_python_app:1.0
docker push gcr.io/salma-youssef-project/gcr_python_app:1.0

```
