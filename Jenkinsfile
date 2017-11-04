node {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/mpac-ops/spring-boot-on-k8s.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'M3'
   }
   stage('Build') {
      // Run the maven build
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
      sh "docker build -t registry.k8sops.mpacops.ca/example/simple-spring-boot -f Dockerfile ."
   }
   
   stage('Push') {
      sh "docker push registry.k8sops.mpacops.ca/example/simple-spring-boot"   
   }
   
   stage('Deploy') {
      sh "kubectl apply -f k8s/deployment.yaml"
      sh "kubectl rollout status deployment/simple-spring-boot"
   }
}