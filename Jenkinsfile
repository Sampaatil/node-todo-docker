pipeline {
    agent any
    stages {
        
        stage("code") {
            
            steps{
                
              git url:"https://github.com/Sampaatil/node-todo-docker.git", branch:"master"
              echo "Code clone is done"  
                
            }
            
        }
        
        stage("build and test") {
            
            steps{
                
                sh "docker build -t node-app ."
                echo "Build is done"
                
            }
            
        }
        
        stage("push to dockerhub") {
            
            steps{
                
                withCredentials([usernamePassword(credentialsId:"Dockerhub",passwordVariable:"dockerhubpass",usernameVariable:"dockerhubuser")]){
                sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}"
                sh "docker tag node-app:latest ${env.dockerhubuser}/node-app:latest"
                sh "docker push ${env.dockerhubuser}/node-app:latest"
                echo "push is done"
                
                }
            }
            
        }
        
        stage("deploy") {
            
            steps{
                
                sh "docker-compose down && docker-compose up -d"
                echo "deploy is done"
                
            }
            
        }
    }
    
}
