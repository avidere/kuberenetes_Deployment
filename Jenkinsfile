pipeline {
    agent any
    environment {
        def git_branch = 'master'
        def git_url = 'https://github.com/avidere/onlinebookstore.git'

        def mvntest = 'mvn test '
        def mvnpackage = 'mvn clean install'
        def build_no = "${env.BUILD_NUMBER}"
        def sonar_cred = 'sonar'
        def code_analysis = 'mvn clean install sonar:sonar'
        def utest_url = 'target/surefire-reports/**/*.xml'

        def nex_cred = 'nexus'
        def grp_ID = 'onlinebookstore'
        def nex_url = '35.77.70.128:8081'
        def nex_ver = 'nexus3'
        def proto = 'http'
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
		stage('Build Docker image and push on Docker hub'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'Docker_hub', passwordVariable: 'docker_pass', usernameVariable: 'docker_user')]) {
                script{
                    sshagent(['Docker-Server']) {
                        def mavenpom = readMavenPom file: 'pom.xml'
                        def artifactId= 'onlinebookstore'
                        def tag = "${mavenpom.version}"

                     //   sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 sed -i 's/tag/${mavenpom.version}-${env.build_no}/g' Deployment.yaml "
                      //  sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 sudo cp Deployment.yaml service.yaml /home/ubuntu/"
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 docker build --build-arg artifact_id=${artifactId} --build-arg host_name=${env.nex_url} --build-arg version=${mavenpom.version} --build-arg build_no=${env.build_no} -t avinashdere99/onlinebookstore:${mavenpom.version}-${env.build_no} ."
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 docker login -u $docker_user -p $docker_pass"
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 docker push avinashdere99/onlinebookstore:${mavenpom.version}-${env.build_no}"
                        sh "ssh -o StrictHostKeyChecking=no -l dockeradmin 172.31.22.228 docker rmi avinashdere99/onlinebookstore:${mavenpom.version}-${env.build_no}"
                    }
                   }
                }
            }
        }
    }
}
