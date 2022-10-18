pipeline {
    agent {label 'agent'}

    stages {
        stage('Cloning our Git') {
            steps {
                git url:'https://github.com/mahmoud254/jenkins_nodejs_example',
                    credentialsId: 'github_key'

                
            }
        }
        stage('Building our image'){
            steps {
                sh "docker build . -t mostafaashour99/myapp:$BUILD_NUMBER" 
            }
        }
        stage('Push image') {
             steps {
                withDockerRegistry([ credentialsId: "dockerhubaccount", url: "" ]) {
                    sh "docker push mostafaashour99/myapp:$BUILD_NUMBER"
                }
             }
        post {
        	success {
        		slackSend color: "#439FE0" , message:"Build deployed successfully - ${env.JOB_NAME} ${env.BUILD_NUMBER}"
        	}
        	failure {
     		   slackSend failOnError:true , message:"Build failed  - ${env.JOB_NAME} ${env.BUILD_NUMBER} "
    		}
        }
        }
    }
}
