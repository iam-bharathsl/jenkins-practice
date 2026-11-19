pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Hello') {
            steps {
                echo 'Hello from a Jenkinsfile in GitHub!'
            }
        }
        stage('Files') {
            steps {
                sh 'ls -la'
                sh 'cat README.md'
            }
        }
    }
}