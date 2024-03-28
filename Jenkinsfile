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
    stage("Install Dependencies"){
        steps{
            sh 'npm install'
        }
    }
    stage("OWASP DEPENDENCY CHECK"){
        steps{
            dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP-check'
            dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
        }
    }
    stage("Trivy FS SCAN"){
        steps{
            sh 'trivy fs . > trivyfs.txt'
        }
    }
    stage("DOCKER BUILD & PUSH"){
        steps{
            script{
                withDockerRegistry(credentialsId: 'docker', toolName: 'docker'){
                    sh 'docker build -t swiggy-clone-cicd .'
                    sh 'docker tag swiggy-clone-cicd yatingambhir/swiggy-clone-cicd:latest'
                    sh 'docker push yatingambhir/swiggy-clone-cicd:latest'
                }
            }
        }
    }
    stage("TRIVY"){
        steps{
            sh 'trivy image yatingambhir/swiggy-clone-cicd:latest > trivy.txt'
        }
    }
    stage("DOCKER DEPLOYMENT"){
        steps{
            sh 'docker run -itd --name swiggy-clone-cicd -p 3000:3000 swiggy-clone-latest'
        }
    }
  }
}

            
