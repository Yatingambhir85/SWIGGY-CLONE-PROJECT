pipeline{
    agent any
  tools{
    nodejs 'nodejs16'
    jdk 'jdk17'
  }
  environment{
    SONAR_HOME=tool 'sonar-scanner'
  }
  stages{
    stage("Clean Workspace"){
      steps{
        cleanWs()
      }
    }
    stage("Git checkout"){
      steps{
        git branch: 'main', url:'https://github.com/Yatingambhir85/SWIGGY-CLONE-PROJECT'
      }
    }
    stage("Static Code Analysis"){
      steps{
        withSonarQubeEnv('sonar-server'){
          sh '$SONAR_HOME/bin/sonar-scanner -Dsonar.projectName=swiggy-clone-cicd -Dsonar.projectKey=swiggy-clone-cicd '
        }
      }
    }
  }
}
