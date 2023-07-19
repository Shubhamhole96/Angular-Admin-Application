pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Check out the code from the GitHub repository
                git url: 'https://github.com/Simplilearn-Edu/estore-admin-dashboard.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Use Node.js to install Angular dependencies
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Build the Angular application in production mode
                sh 'npm run build --prod'
            }
        }

        stage('Test') {
            steps {
                // Execute Angular unit tests
                sh 'npm run test'
            }
        }

        stage('Docker Build') {
            steps {
                // Build the Docker image for the Angular Admin Application
                sh 'docker build -t angular-admin-app .'
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the Dockerized Angular Admin Application to a server or cloud provider
                // For example, push the image to a Docker registry or deploy to AWS ECS, Azure Kubernetes Service, etc.
                // The exact deployment process will depend on your infrastructure and requirements.
            }
        }
    }

    post {
        always {
            // Clean up after the pipeline finishes (e.g., remove temporary files or containers)
            sh 'npm clean'
        }
    }
}
