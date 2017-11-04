node {
   def gHome
   stage('Preparation') {
      // Get some code from a GitHub repository
      git 'https://github.com/mpac-ops/spring-boot-on-k8s.git'
      gHome = tool 'Gradle'
   }
   stage('Build') {
      sh "${gHome}/bin/gradle clean build"
      sh "docker build -t registry.k8sops.mpacops.ca/example/simple-spring-boot -f Dockerfile ."
   }
   
   stage('Push') {
      sh "docker push registry.k8sops.mpacops.ca/example/simple-spring-boot"   
   }
   
   stage('Deploy') {
      sh "kubectl apply -f k8s/"
      sh "kubectl rollout status deployment/simple-spring-boot"
   }
}
