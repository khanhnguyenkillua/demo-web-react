pipeline {
    agent none

    stages {
        stage('Prepare') {
            agent { label 'docker-pipeline' }
            steps {
                // Bước chuẩn bị: Pull source code từ repository
                git 'https://github.com/your/repository.git'
            }
        }
        stage('Build') {
            agent { label 'docker-pipeline' }
            steps {
                // Bước xây dựng: Build ứng dụng của bạn (nếu cần)
                sh 'npm install' // Ví dụ: Cài đặt các phụ thuộc cho một ứng dụng Node.js
                sh 'npm run build' // Ví dụ: Build ứng dụng Node.js

                // Bước push Docker image lên Docker Hub
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        def image = docker.build('your-dockerhub-username/your-image-name:latest', '.')
                        image.push()
                    }
                }
            }
        }
        stage('Deploy') {
            agent { label 'docker-pipeline' }
            steps {
                // Bước triển khai: Triển khai ứng dụng từ Docker Hub
                script {
                    docker.withRegistry('', 'docker-hub-credentials') {
                        def image = docker.image('your-dockerhub-username/your-image-name:latest')
                        image.pull()
                        image.run('-p 8080:80 --name your-container-name -d')
                    }
                }
            }
        }
    }
}
