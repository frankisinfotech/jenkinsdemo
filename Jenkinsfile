pipeline {
  agent any
  stages {  
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t frankisinfotech/demoapp:""BUILD_NUMBER"" .'
        }
       }
  stage ('Publish to DockerHub') {
    steps {
       withDockerRegistry([CredentialsId: "docker-hub", url: "" ]) {
        sh 'docker push frankisinfotech/demoapp:""BUILD_NUMBER""'
        }
       }
       }
   }
 }
   
