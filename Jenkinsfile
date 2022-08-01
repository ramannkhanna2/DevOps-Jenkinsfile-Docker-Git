pipeline {
    agent any

    stages {
        stage('Build&Deploy') {
            steps {
             // Get SHA1 of current commit
              script {
                 commit_id = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
              }
             // remove previous containers
             sh "sudo docker rm -f `docker ps -aq`"   
             // BUILD the Docker image
             sh "sudo docker build -t image-name:${commit_id} ."
             // SDEPLOYMENT:  Running docker container as my application   
             sh "sudo docker run -d -p 81:80 --name mycontainer image-name:${commit_id}" 
            }
        }
    }    
}
