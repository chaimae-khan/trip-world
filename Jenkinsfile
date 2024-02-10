pipeline {

  environment {
    dockerimagename = "travelworld/travelworld"
    dockerImage = ""
  }

  agent any
  stages {
        stage('Build image') {
            steps {
                script {
                    dockerImage = dockerComposeBuild(buildFile: 'docker-compose.yml', imageName: dockerimagename)
                }
            }
        }
    }
}

  
