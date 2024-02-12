pipeline {
    agent any

    environment {
       DOCKER_IMAGE_NAME = 'travelworld'
       registryCredential = 'dockerhublogin'
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
 stage('Pushing Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                        // Tag the Docker image
                        sh "docker tag ${DOCKER_IMAGE_NAME} latest"
                        
                        // Push the Docker image
                        sh "docker push ${DOCKER_IMAGE_NAME}"
                    }
                }
            }
    }}}

    
