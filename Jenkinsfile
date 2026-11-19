pipeline {
    agent any

    triggers {
        pollSCM('H/2 * * * *')
    }

    parameters {
        string(name: 'GREET_NAME', defaultValue: 'Jenkins', description: 'Who should we greet?')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run the test stage?')
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'prod'], description: 'Target environment')
    }

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
            when {
                expression { params.RUN_TESTS }
            }
            steps {
                sh 'bash tests/test_greet.sh'
            }
        }
        stage('Run') {
            steps {
                echo "Target environment: ${params.ENVIRONMENT}"
                sh "bash app/greet.sh '${params.GREET_NAME}'"
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