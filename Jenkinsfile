node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        
        /*app = docker.build("leexha/chocolates1991")*/
    }


    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        sh """
            #echo `pwd`
            #export DOCKER_CONTENT_TRUST=1
            #export DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE=Password123!
            #export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE=Password123!
            #export DOCKER_CONTENT_TRUST_SERVER=https://notary.docker.io/
            #export DOCKER_CONTENT_TRUST_SERVER=https://127.0.0.1:4443
            #git clone https://github.com/theupdateframework/notary.git
            #cd notary
            #docker-compose build
            #docker-compose up -d
            #mkdir -p ~/.notary && cp cmd/notary/config.json cmd/notary/root-ca.crt ~/.notary
            #export dockerpid=\$!
            #rm -rf /var/lib/jenkins/.docker 
            #cp -rpf /var/lib/jenkins/.docker ~/
            #cp -rpf /var/lib/jenkins/.docker /var/lib/jenkins/workspace/Docker_automation@tmp
        """
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            /*app.push("${env.BUILD_NUMBER}")*/
            sh"""
                echo `pwd`
                export DOCKER_CONTENT_TRUST=1
                export DOCKER_CONTENT_TRUST_ROOT_PASSPHRASE=Password123!
                export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE=Password123!
                export DOCKER_CONTENT_TRUST_SERVER=https://127.0.0.1:4443
                docker build -t leexha/testjenkins:signed .
                docker push leexha/testjenkins:signed
            """


        }
        
        sh """
            #kill -9 $dockerpid
        """
       
    }
}

