pipeline {
    agent any

    environment {
        APP_NAME = 'greeter'
    }

    stages {
        stage('Build') {
            steps {
                echo "Building ${APP_NAME}, build number ${BUILD_NUMBER}"
                sh 'mkdir -p dist'
                sh 'tar -czf dist/${APP_NAME}-${BUILD_NUMBER}.tar.gz app'
            }
        }
        stage('Test') {
            steps {
                sh 'bash tests/test_greet.sh'
            }
        }
        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'dist/*.tar.gz', fingerprint: true
            }
        }
    }

    post {
        success {
            echo 'Build and tests passed!'
        }
        failure {
            echo 'Something failed, check the console output.'
        }
    }
}