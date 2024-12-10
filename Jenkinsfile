pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh "./gradlew clean run"
            }
        }
        stage("Upload"){
            steps {
                withAWS(region: 'us-east-1', credentials: 'aws-resume') {
                    s3Upload(file:'./build/resumeOutput/resume.html', bucket: '', path:'resume.html')
                    s3Upload(file:'./build/resumeOutput/DavidPurdy-resume.fo', bucket:'resume.davidpurdy.net', path:'DavidPurdy-resume.fo')
                    s3Upload(file:'./build/resumeOutput/DavidPurdy-resume.pdf', bucket:'resume.davidpurdy.net', path:'DavidPurdy-resume.pdf')
                    s3Upload(file:'./build/resumeOutput/DavidPurdy-resume.rtf', bucket:'resume.davidpurdy.net', path:'DavidPurdy-resume.rtf')
                    s3Upload(file:'./build/resumeOutput/DavidPurdy-resume.txt', bucket:'resume.davidpurdy.net', path:'DavidPurdy-resume.txt')
                }    
            }
        }
    }
}