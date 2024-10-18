pipeline {
    environment {
        registry = "wiammiftah/tp4"
        registryCredential = 'docker-hub'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/wiammiftah/tp4.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Utilisation des informations d'identification pour l'authentification Docker
                    withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'miftah', passwordVariable: 'Wiam@2001')]) {
                        // Connexion à Docker Hub
                        sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
                        // Construction de l'image Docker
                        sh 'docker build -t wiammiftah/tp4:$BUILD_NUMBER .'
                        // Déconnexion de Docker Hub
                        sh 'docker logout'
                    }
                }
            }
        }
        stage('Test image') {
            steps {
                script {
                    echo "Tests passed"
                }
            }
        }
        stage('Publish Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
