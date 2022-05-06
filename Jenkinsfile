pipeline {
  agent any
  stages {  
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t frankisinfotech/demoapp:""GIT_COMMIT"" .'
        }
       }
  stage ('Publish to DockerHub') {
    steps {
       withDockerRegistry([credentialsId: "docker-hub", url: "" ]) {
        sh 'docker push frankisinfotech/demoapp:""BUILD_NUMBER""'
        }
       }
       }
   }
 }
   
