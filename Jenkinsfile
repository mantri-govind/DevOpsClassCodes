
pipeline{
    tools{
        jdk 'myjava'
        maven 'mymaven'
    }
	agent any
      stages{
           stage('Checkout'){
	    
               steps{
		 echo 'cloning..'
                 git 'https://github.com/Sonal0409/DevOpsClassCodes.git'
              }
          }
          stage('Compile'){
             
              steps{
                  echo 'compiling..'
                  sh 'mvn compile'
	      }
          }
          stage('CodeReview'){
		  
              steps{
		    
		  echo 'codeReview'
                  sh 'mvn pmd:pmd'
              }
          }
           stage('UnitTest'){
		  
              steps{
	         echo 'Testing'
                  sh 'mvn test'
              }
               post {
               success {
                   junit 'target/surefire-reports/*.xml'
               }
           }	
          }
           stage('MetricCheck'){
              
              steps{
                  sh 'mvn cobertura:cobertura -Dcobertura.report.format=xml'
              }
              
          }
          stage('Package'){
		  
              steps{
		  
                  sh 'mvn package'
              }
          }
	 stage('Docker Build') {
           steps {
              
                sh 'docker build -t devopsclasscodes:latest .' 
                sh 'docker tag devopsclasscodes:latest mantrig/devopsclasscodes:latest'
               
          }
        }
     
	stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push  mantrig/devopsclasscodes:latest'
        }
                  
          }
        }
     
      stage('Deploy using container') {
           steps 
  		 {
                sh "docker run -d -p 8090:8080  mantrig/devopsclasscodes:latest'"
 
            }
        }
	   
      }
}
