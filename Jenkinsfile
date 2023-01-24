pipeline {
    agent any
    environment {
        
        def git_branch = 'master'
        def git_url = 'https://github.com/avidere/Pythonapp-deployment.git'
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
		stage('Build Docker image and push To Docker hub'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'Docker_hub', passwordVariable: 'docker_pass', usernameVariable: 'docker_user')]) {
                script{
                    sshagent(['Docker-Server']) {
                          sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 git clone ${git_url} "
                          sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 mv /home/dockeradmin/Pythonapp-deployment/Dockerfile ../ "
                          sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 sudo mv Pythonapp-deployment /home/ubuntu/ "
                          sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 sudo sed -i 's/tag/${env.BUILD_NUMBER}/g' /home/ubuntu/Pythonapp-deployment/web_deployment.yaml"
                         // sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 sudo cp /home/ubuntu/Pythonapp-deployment/*.yaml /home/ubuntu/"
                          sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 docker build -t avinashdere99/python:${env.build_no} ."
                          sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 docker login -u $docker_user -p $docker_pass"
                          sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 sudo rm -r /home/ubuntu/Pythonapp-deployment "
                         // sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 docker push avinashdere99/python:${env.build_no}"
                        //sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.2.23 docker rmi avinashdere99/python:${env.build_no}"
                    }
                  }
                }
            }
        }/*
        stage('Build Docker image and push To Docker hub'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'Docker_hub', passwordVariable: 'docker_pass', usernameVariable: 'docker_user')]) {
                script{
                    sshagent(['Docker-Server']) {
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 sed -i 's/tag/${env.build_no}/g' Deployment.yaml "
                      //  sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 sudo cp Deployment.yaml service.yaml /home/ubuntu/"
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 "
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 "
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 "
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 "
                    }
                  }
                }
            }
        } */
    }
}
