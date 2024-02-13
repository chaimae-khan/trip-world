pipeline {
    agent any

    environment {
       DOCKER_IMAGE_NAME = 'travelworld'
       DOCKERHUB_CREDENTIALS = credentials('chaimaekh-dockerhub')
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    script {
                    // Build Docker image using Docker Compose
                    sh "docker-compose build"
                    
                    // Set Docker image name as environment variable
                    env.DOCKER_IMAGE_NAME = DOCKER_IMAGE_NAME
                }
                }
            }
        }
      stage('Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'chaimaekh-dockerhub', passwordVariable: 'DOCKERHUB_CREDENTIALS_PSW', usernameVariable: 'DOCKERHUB_CREDENTIALS_USR')]) {
                        sh "echo \$DOCKERHUB_CREDENTIALS_PSW | docker login -u \$DOCKERHUB_CREDENTIALS_USR --password-stdin"
                        echo 'Login successful'
                    }
                }
            }
        }
}}

    
