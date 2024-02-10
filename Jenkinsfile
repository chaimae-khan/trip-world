pipeline {
    agent any

    environment {
        DOCKER_COMPOSE_VERSION = '1.29.0'
        DOCKER_COMPOSE_URL = "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)"
        DOCKER_HUB_REPO = 'your_dockerhub_username/your_dockerhub_repository'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "curl -L ${DOCKER_COMPOSE_URL} -o docker-compose"
                    sh "chmod +x docker-compose"
                    sh "sudo mv docker-compose /usr/local/bin/"

                    // Build Docker image using Docker Compose
                    sh "docker-compose build"
                }
            }
        }}}

    
