pipeline {
    agent any
    parameters {
        string(name: 'DOCKER_TAG', defaultValue: '', description: '')
    }
    stages {
	stage('Update Code Version') {
            steps {
                sh '''
                chmod u+x update_version.sh
		./update_version.sh 
                '''
            }
	}
        stage('Build Dockerfile') {
            steps {
                sh '''
                echo anirudh1101/kubernetes-test:${DOCKER_TAG}
                sudo docker build -t anirudh1101/kubernetes-test:${DOCKER_TAG} .
                sudo docker images -a | sed -n '2p'
                '''
            }
        }
        stage('Push DockerImage') {
            steps {
                sh '''
                sudo docker push anirudh1101/kubernetes-test:${DOCKER_TAG}
                '''
            }
        }
    }
}

