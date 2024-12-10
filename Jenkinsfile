#!/usr/bin/env groovy
pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = credentials('AWS_DEFAULT_REGION')
        AWS_EKS_CLUSTER_NAME = credentials('AWS_EKS_CLUSTER_NAME')
    }

    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('EKS-cluster') {
                        sh "terraform init --backend-config=dev-backend.tfvars"
                        sh "terraform plan"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws eks update-kubeconfig --name $AWS_EKS_CLUSTER_NAME --region $AWS_DEFAULT_REGION"
                        sh "cat /var/lib/jenkins/.kube/config"
                        sh "kubectl apply -f nginx.yaml --namespace default"
                    }
                }
            }
        }
    }
}
