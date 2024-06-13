pipeline {
    agent none
    environment {
        IMAGE_NAME = 'demo-web-react'
        IMAGE_TAG = 'latest'
	IdDockerRegistry = '192.168.0.197:6000'
    }
    stages {
        stage('Prepare') {
            agent { label 'node_dockerhub' }
            steps {
		 script {
                // Pull source code từ repository
                  git 'https://github.com/khanhnguyenkillua/demo-web-react.git'
 		  sh 'npm install'
                  sh 'npm run build'
		  sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .' 
		  sh 'docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${IdDockerRegistry}/Killua/${IMAGE_NAME}:${IMAGE_TAG}'
		  sh 'docker push ${IdDockerRegistry}/Killua/${IMAGE_NAME}:${IMAGE_TAG}'
		}
            }
        }
        stage('Build') {
            agent { label 'node_Web' }
            steps {
		 script {
               	  sh 'docker pull ${IdDockerRegistry}/Killua/${IMAGE_NAME}:${IMAGE_TAG}'
		  sh """
                  if [ \$(docker ps -q -f name=${IMAGE_NAME}) ]; then
                      docker stop ${IMAGE_NAME}
                      docker rm ${IMAGE_NAME}
                  fi
                  """	
		  sh 'docker run -d --name ${IMAGE_NAME} -p 80:80 ${IMAGE_NAME}:${IMAGE_TAG} .'	
		}
            }
        }
    }
}

