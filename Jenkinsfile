pipeline {
    agent any
    environment {
        
        def git_branch = 'master'
        def git_url = 'https://github.com/shankar7773/Pythonapp-deployment.git'
    }
    stages {
        stage('Git Checkout') {
            steps {
                script {
                    git branch: "${git_branch}", url: "${git_url}"
                    echo 'Git Checkout Completed'
                }
            }
        }
        stage('Build  and Test Code') {
            steps {
                script {
                  //  sh 'python3 rsvp.py'
                    sh 'python3 -m pytest'
                }
            }
        }    
/*		stage('Build Docker image and push To Docker hub'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'Dockerhub1', passwordVariable: 'pp', usernameVariable: 'uu')]) {
                script{
                    sshagent(['k8']) {
                          //sh "ssh -o StrictHostKeyChecking=no -l  172.31.89.114 sudo rm -r Pythonapp-deployment"
                          sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 git clone ${git_url} "

       
                          sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 sudo sed -i 's/tag/${env.BUILD_NUMBER}/g' /home/dockeradmin/Pythonapp-deployment/web_deployment.yaml"
                         // sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 sudo cp /home/ubuntu/Pythonapp-deployment/*.yaml /home/ubuntu/"
                          sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 docker build -t shankar7773/python:${env.BUILD_NUMBER} /home/dockeradmin/Pythonapp-deployment/."
                          sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 docker login -u $uu -p $pp"
                       //   sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 sudo rm -r Pythonapp-deployment "
                          sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 docker push shankar7773/python:${env.BUILD_NUMBER}"
                          sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 docker rmi shankar7773/python:${env.BUILD_NUMBER}"
                    }
                  }
                }
            }
        }
        stage('Deploy Application on EKS Cluster'){
            steps{
                script{
                    sshagent(['k8']) {
                        sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 sudo kubectl apply -f Pythonapp-deployment "
                        sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 sudo kubectl get po"
                        sh "ssh -o StrictHostKeyChecking=no -l ubuntu 172.31.89.114 sudo kubectl get all "
                        
                    }
                }
            }
        } */
    }
}
