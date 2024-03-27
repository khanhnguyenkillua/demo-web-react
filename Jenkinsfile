pipeline {
    agent none

    stages {
        stage('Prepare') {
            agent { label 'docker-pipeline' }
            steps {
                //  Pull source code từ repository
                git 'https://github.com/khanhnguyenkillua/demo-web-react.git'
            }
        }
        stage('Build') {
            agent { label 'docker-pipeline' }
            steps {
                // Build Stage
                sh 'npm install' 
                sh 'npm run build'

                // Push Docker Image in ....
                script {
                   
                    }
                }
            }
        }
        stage('Deploy') {
            agent { label 'docker-pipeline' }
            steps {
                // Pull Image and Deloy
                script {
                 
                    }
                }
            }
        }
    }
}
