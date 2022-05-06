pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t frankisinfotech/jenkinsdemo:""$BUILD_ID"" .'
      }
    }
    
     stage ('Publish') {
      steps {
        withDockerRegistry([credentialsId: "docker-hub", url: ""]) {
          sh 'docker push frankisinfotech/jenkinsdemo:""$BUILD_ID""'
         }
       }
     }
  }
}
