pipeline {
  agent any
  stages {
    stage ('GetEnv') {
      steps {
        sh 'printenv'
        
      }
    }
    stage ('Publish to ECR') {
      steps {
        withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/t7e2c6o4'
          sh 'docker build -t agency-banking .'
          sh 'docker tag agency-banking:latest 765176032689.dkr.ecr.eu-west-1.amazonaws.com/agency-banking:latest:""$BUILD_ID""'
          sh 'docker push 765176032689.dkr.ecr.eu-west-1.amazonaws.com/agency-banking:""$BUILD_ID""'
          
          // sh 'docker tag agency-banking:latest public.ecr.aws/t7e2c6o4/ecr-demoimg:""$BUILD_ID""'
          // sh 'docker push public.ecr.aws/t7e2c6o4/ecr-demoimg:""$BUILD_ID""'
        }
      }
    }
  }
}
