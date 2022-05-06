pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t frankisinfotech/jenkinsdemo:""$GIT_COMMIT"" .'
      }
    }
    
     stage ('Publish') {
      steps {
        withDockerRegistry([credentialsId: "docker-hub", url: ""]) {
          sh 'docker push frankisinfotech/jenkinsdemo:""$GIT_COMMIT""'
         }
       }
     }
  }
}
