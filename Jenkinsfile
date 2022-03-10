//Jenkins file for Sprint3 Project

pipeline {
    agent any
    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t snehac174/api:build-$BUILD_NUMBER .'
            }
        }
        stage('Push to DockerHub') {
            steps {
                sh 'docker push snehac174/api:build-$BUILD_NUMBER'
            }
        }
        stage('Reapply') {
            steps {
                sh '''kubectl apply -f ./kubernetes/nginx.yaml
                kubectl apply -f ./kubernetes/api-deployment.yaml
                '''
            }
        }
        stage('Cleanup') {
            steps {
                sh 'docker system prune -f'
            }
        }
    }
}
