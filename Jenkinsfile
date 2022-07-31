pipeline {
    agent any
    
    environment {
        docker_repo_uri = "public.ecr.aws/p9h7s8r8/raman-repo"
        task_def_arn = "arn:aws:ecs:us-east-2:677729060277:task-definition/raman-task:6"
        cluster = "raman-ecs"
        region = "us-east-2"
        exec_role_arn = "arn:aws:iam::677729060277:role/ecsTaskExecutionRole"
    }

    stages {
        stage('Build') {
            steps {
             // Get SHA1 of current commit
              script {
                 commit_id = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
              }
             // Build the Docker image
             sh "docker build -t ${docker_repo_uri}:${commit_id} ."
             // Get Docker login credentials for ECR
             sh "aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/p9h7s8r8"
             // Push Docker image
             sh "docker push ${docker_repo_uri}:${commit_id}"
             // Clean up
             sh "docker rmi -f ${docker_repo_uri}:${commit_id}"
            }
        }
    }    
}
