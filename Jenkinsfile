import ae.tii.jenkins.pipelines.Constants
pipeline {
    agent {
        kubernetes {
        inheritFrom 'base-agent'
        yaml """
            spec:
              containers:
              - name: oc-deployer
                image: repo.crypto.tii.ae/docker/oc-deployer:latest
                command:
                - cat
                tty: true
        """
        }
    }
    stages {
        stage('Build new image') {
            steps {
                container('oc-deployer') {
                    script {
                        withFolderProperties {
                            def secrets = [
                                [path: "${VAULT_ENGINE}/claasp-deployment", engineVersion: 2, secretValues: [
                                [envVar: "OC_TOKEN", vaultKey: "OC_TOKEN_KEY"],
                                ]]
                            ]
                            withVault([vaultSecrets: secrets]) {
                                sh """
                                oc login --token=${OC_TOKEN} --insecure-skip-tls-verify=true --server=${Constants.OC_SERVER}
                                oc project claasp-deployment
                                oc start-build test-code-image --follow
                                """
                            }
                        }
                    }
                }
            }
        }
    }
}
