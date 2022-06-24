pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        sh 'docker build -t frankisinfotech/jenkinsdemo:""$GIT_COMMIT"" .'
      }
    }
    
     stage ('Publish to DockerHub') {
      steps {
        withDockerRegistry([credentialsId: "docker-hub", url: ""]) {
          sh 'docker push frankisinfotech/jenkinsdemo:""$GIT_COMMIT""'
         }
       }
     }
    stage ('Publish to ECR') {
      steps {
        //sh 'aws ecr-public get-login-password --region eu-west-2 | docker login --username AWS --password-stdin public.ecr.aws/t7e2c6o4'
        //withAWS(credentials: 'sam-jenkins-demo-credentials', region: 'eu-west-2') {
         withEnv(["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/t7e2c6o4' //985729960198.dkr.ecr.eu-west-2.amazonaws.com'
          sh 'docker build -t frankdemo .'
          sh 'docker tag frankdemo:latest public.ecr.aws/t7e2c6o4/frankdemo:latest'
          sh 'docker push public.ecr.aws/t7e2c6o4/frankdemo:latest'
         }
       }
    }
  }
}
