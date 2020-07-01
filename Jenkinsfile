node{
    stage('SCM Checkout'){
        git 'https://github.com/sekhar1926/exam'
   }
    stage('MVN Package'){
        sh label: '', script: 'mvn clean package'
   }
        stage('Build Docker Image'){
            sh 'docker build -t sekhar1996/exam-1.0.0 .'
        }
        stage('Push Docker Image'){
            withCredentials([string(credentialsId: 'dockerhub_pwd', variable: 'dockerhub_pwd')]) {
                sh 'docker login -u sekhar1996 -p ${dockerhub_pwd}'
            }
            
            sh 'docker push sekhar1996/exam-1.0.0'
        }
        stage('Run container'){
            def dockerRun= 'docker run -i -d -p 192.168.7.200:5000:8080 sekhar1996/exam-1.0.0'
            sshagent(['slave_pri_key']) {
                sh "ssh -o StrictHostKeyChecking=no adisekhar@192.168.7.200 ${dockerRun}"
       }     
   }
}
