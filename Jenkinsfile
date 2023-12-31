pipeline {
    agent any

    parameters {
        string(
            defaultValue: 'reactapp_jenkins',
            description: 'repo folder name',
            name: 'REPO_NAME'
        )
    }

    stages {

        stage('Already Repo Folder Delete') {
            steps {
                script {
                    sh "rm -rf ${params.REPO_NAME}"
                }
            }
        }

        stage('Git Clone') {
            steps {
                script {
                    sh "git clone git@github.com:Rohan2111/${params.REPO_NAME}.git"
                }
            }
        }

        stage('Docker build image') {
            steps {
                script {
                    sh "cd ${params.REPO_NAME}/ && docker build -t reactapp ."
                }
            }
        }

        stage('Docker Compose if Already Exist') {
            steps {
                script {
                    sh "cd ${params.REPO_NAME}/ && docker-compose down"
                }
            }
        }

        stage('Docker Compose Container') {
            steps {
                script {
                    sh "cd ${params.REPO_NAME}/ && docker-compose up -d"
                }
            }
        }
    }

    post {
        success {
            emailext (
                subject: "Pipeline Successful",
                body: "The pipeline was successful. No further action is required.",
                to: "rohan.goswami@silverpush.co"
            )
        }
        
        failure {
            emailext (
                subject: "Pipeline Failed",
                body: "The pipeline failed. Please check the Jenkins console output for details.",
                to: "rohan.goswami@silverpush.co",
                attachLog: true
            )
        }
    }
}
