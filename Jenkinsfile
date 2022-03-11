//Jenkins file for Sprint3 Project

pipeline {
    agent any
    stages {
        //stage('Build Image') {
            //steps {
                //sh 'docker build -t snehac174/api:build-$BUILD_NUMBER .'
            //}
        //}
        //stage('Push to DockerHub') {
            //steps {
                //sh 'docker push snehac174/api:build-$BUILD_NUMBER'
            //}
        //}
        stage('Build Image') {
            steps {
                sh 'docker build -t gcr.io/lbg_210222/api-sneha:build-$BUILD_NUMBER -t gcr.io/lbg_210222/api-sneha:latest .'
            }
        }
        stage('Push Image to GCR.IO') {
            steps {
                sh 'docker push gcr.io/lbg_210222/api-sneha:build-$BUILD_NUMBER'
                sh 'docker push gcr.io/lbg_210222/api-sneha:latest'
            }
        }
        stage('Reapply') {
            steps {
                sh '''kubectl apply -f ./kubernetes/nginx.yaml
                kubectl apply -f ./kubernetes/api-deployment.yaml
                '''
                //if above apply is not able to pick up the latest tag since image was changed 
                //use restart deployment
                //sh 'kubectl rollout restart deployment/api'
            }
        }
        stage('Cleanup') {
            steps {
                sh '''docker system prune -f
                docker rmi gcr.io/lbg_210222/api-sneha:build-$BUILD_NUMBER
                '''
            }
        }
    }
}
