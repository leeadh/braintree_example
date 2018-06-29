node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        
        app = docker.build("leexha/sample1234568")
    }


    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
                        sh"""
            export DOCKER_CONTENT_TRUST=1
            export DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE=Password123!
            export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE=Password123!
            docker build -t leexha/test12345678:latest .
            docker push leexha/test12345678:latest
        
       
            """

        }
    }
}

