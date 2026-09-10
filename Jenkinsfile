```groovy
pipeline {

    agent any

    tools {
        nodejs 'NodeJS-20'
    }

    environment {
        NODE_OPTIONS = '--openssl-legacy-provider'
        CI = 'false'
    }

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/betawins/Trading-UI.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install --legacy-peer-deps'
            }
        }

        stage('Test') {
            steps {
                sh 'CI=true npm test -- --watchAll=false'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    pm2 delete Trading-UI || true
                    pm2 serve build 3000 --name Trading-UI --spa
                    pm2 save
                '''
            }
        }
    }
}
```
