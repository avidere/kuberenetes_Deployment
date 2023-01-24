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
        stage('Build Code') {
            steps {
                script {
                    sh 'python rsvp.py'
                }
            }
        }    /*
		stage('Build Docker image and push To Docker hub'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'Docker_hub', passwordVariable: 'docker_pass', usernameVariable: 'docker_user')]) {
                script{
                    sshagent(['Docker-Server']) {
                     //   sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 sed -i 's/tag/${mavenpom.version}-${env.build_no}/g' Deployment.yaml "
                      //  sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 sudo cp Deployment.yaml service.yaml /home/ubuntu/"
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 docker build -t avinashdere99/python:${env.build_no} ."
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 docker login -u $docker_user -p $docker_pass"
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 docker push avinashdere99/python:${env.build_no}"
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 docker rmi avinashdere99/python:${env.build_no}"
                    }
                  }
                }
            }
        }
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
