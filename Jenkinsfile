#!/usr/bin/env groovy

pipeline {

    agent {
        docker {
            image 'node'
            args '-u root'
        }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'npm test'
            }
        }
        stage('Submit Stack') {
            steps {
                sh "aws cloudformation create-stack --stack-name s3bucket --template-body file://jenkins_test.yaml --region 'us-east-1'"
                }
            }    
        }
    }
