pipeline {
    //agent any  // Use any available agent to execute this pipeline
    agent { label 'agent-1' }

    // -----------------------------
    // Pipeline Parameters (User Inputs)
    // -----------------------------
    parameters {
        string(name: 'APP_NAME', defaultValue: 'myapp', description: 'Name of the Docker image to build')
        choice(name: 'DEPLOY_ENV', choices: ['dev', 'qa', 'prod'], description: 'Target deployment environment')
        booleanParam(name: 'CLEANUP_OLD', defaultValue: true, description: 'Cleanup old Docker container before deployment')
        string(name: 'HOST_PORT', defaultValue: '8081', description: 'Host port to expose container on')

    }

    // -----------------------------
    // Environment Variables
    // -----------------------------
    environment {
        BUILD_TS = "${new Date().format('yyyyMMdd-HHmmss')}"  // Timestamp for tagging
        CONTAINER_NAME = "container-${params.APP_NAME}"       // Container name based on input
        // HOST_PORT = '8081'                                    // Exposed port on host
        APP_PORT = '80'                                       // Application port inside container
    }

    // -----------------------------
    // Pipeline Options
    // -----------------------------
    options {
        timestamps()               // Show timestamps in logs
        timeout(time: 5, unit: 'MINUTES')  // Auto-fail if pipeline takes longer than 5 minutes
        retry(2)                   // Retry failed steps up to 2 times
    }

    stages {
        // -----------------------------
        // Stage 1: Manual Approval for PROD
        // -----------------------------
        stage('Input Approval') {
            when {
                expression { params.DEPLOY_ENV == 'prod' } // Only trigger input on production deployments
            }
            steps {
                input message: "You are about to deploy to *PRODUCTION*. Are you sure?", ok: 'Yes, deploy to PROD'
            }
        }

        // -----------------------------
        // Stage 2: Build & Deploy Docker Container
        // -----------------------------
        stage('Build & Deploy') {
            steps {
                script {
                    // Get short Git commit ID for tagging
                    def commitId = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()

                    // Combine image name with Git hash, timestamp, and build number
                    def buildTag = "${params.APP_NAME}:${commitId}-${BUILD_TS}-b${env.BUILD_NUMBER}"
                    echo "Docker image tag to be used: ${buildTag}"

                    // Cleanup previous container if checkbox was selected
                    if (params.CLEANUP_OLD) {
                        sh """
                            if docker ps -a --format '{{.Names}}' | grep -w ${CONTAINER_NAME}; then
                                echo "Stopping and removing existing container: ${CONTAINER_NAME}"
                                docker rm -f ${CONTAINER_NAME}
                            else
                                echo "No existing container to clean up."
                            fi
                        """
                    }

                    // Build Docker image with dynamic tag
                    sh "docker build -t ${buildTag} ."

                    // Run Docker container with mapped ports and unique name
                    sh """
                        docker run -d --name ${CONTAINER_NAME} \\
                            -p ${params.HOST_PORT}:${APP_PORT} \\
                            ${buildTag}
                    """
                }
            }
        }
    }

    // -----------------------------
    // Post-build actions (Always runs)
    // -----------------------------
    post {
        success {
            echo "✅ Build & deployment completed successfully for ${params.APP_NAME}!"
        }
        failure {
            echo "❌ Something went wrong during the build or deployment."
        }
        always {
            echo "📦 Pipeline completed at: ${BUILD_TS}"
        }
    }
}
