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
       stage('Read YAML') {
            steps {
                script {
                    // Ensure the Pipeline Utility Steps plugin is installed
                    def config = readYaml file: 'jenkins_test.yaml'
                    echo "The value from YAML file: ${config.someValue}"
                }
            }
        } 
    }
}
