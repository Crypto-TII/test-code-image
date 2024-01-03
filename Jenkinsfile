import ae.tii.jenkins.pipelines.Constants
pipeline {
    agent {
        node {
            label 'base-agent'
        }
    }
    stages {
        stage('Build and push test-code-image') {
            steps {
                script {
                    BUILT_IMAGE = dockerImage.build("claasp-test-code", "./Dockerfile")
                }
            }
        }
    }
}

// git@bitbucket.org:tiicrypto/test-code-image.git
// BUILT_IMAGE = dockerImage.build("cloud/private-squid-authentication-server", "./dockerfile-deploy", ["--build-arg": "AD_DOMAIN=${AD_DOMAIN}", "--build-arg": "AD_IP_ADDRESS=${AD_IP_ADDRESS}"])
