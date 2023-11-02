pipeline {
    agent any

    stages {
        stage('Git Clone') {
            steps {
                script {
                    sh 'git clone git@github.com:Rohan2111/reactapp_jenkins.git'
                }
            }
        }

        stage('Docker build image') {
            steps {
                script {
                    sh 'cd reactapp_jenkins/ && docker build -t reactapp .'
                }
            }
        }

        stage {
            steps('Docker Compose Container')  {
                script {
                    sh 'cd reactapp_jenkins/ && docker-compose up -d'
                }
            }
        }
    }
}