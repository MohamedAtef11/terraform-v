pipeline {
    agent any

    stages {
        stage('init') {
            steps {
                sh 'terraform init' 
            }
        }
        stage('apply') {
            steps {
                sh 'terraform destroy -auto-approve -state=./terraform.tfstate'
            }
        }
    }
}
