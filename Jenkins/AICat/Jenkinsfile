pipeline {
    agent any 

    environment {
        // Define any environment variables if needed
    }

    stages {
        stage('Checkout code') {
            steps {
                // Get your code from the VCS
                checkout scm 
            }
        }

        stage('Run Script to Set Up Environment') {
            steps {
                // Execute your script to set up the environment
                sh './path_to_your_script.sh'
            }
        }

        stage('Check Environment') {
            steps {
                // Execute any additional checks you might need
                sh 'docker ps -a'
            }
        }
    }

    post {
        always {
            // Actions to always run, even if the pipeline fails
        }
        success {
            // Actions to run only if the pipeline was successful
        }
        failure {
            // Actions to run only if the pipeline failed
        }
    }
}
