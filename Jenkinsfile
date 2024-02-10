pipeline {
    agent any

    environment {
       DOCKER_IMAGE_NAME = 'travelworld'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    script {
                    // Build Docker image using Docker Compose
                    sh "sudo docker-compose build"
                    
                    // Set Docker image name as environment variable
                    env.DOCKER_IMAGE_NAME = DOCKER_IMAGE_NAME
                }
                }
            }
        }}}

    
