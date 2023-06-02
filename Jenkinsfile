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
	stage('Create K8 NS Prod') {
            steps {
                sh '''
                kubectl create ns prod
                '''
            }
        }
	stage('Create K8 Service') {
    	    steps {
                script {
                    try {
                        sh "kubectl apply -f service.yml"
                    } catch(error) {
                        sh "kubectl create -f service.yml"
                    }
                }
            }    
        }
	stage('Deploy Kubernetes Cluster') {
            steps {
                sh '''
                sudo kubectl apply -f deploy.yml
                '''
            }
        }
	stage('List the Revision Numbers') {
            steps {
                sh '''
                echo "Deployment revision is ....."
                sudo kubectl rollout history deploy firstdeploy -n prod
                '''
            }
        }
    }
}

