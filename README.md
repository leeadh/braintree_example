# Braintree Hosted Fields Python demo using Flask 

This is a  basic example of the Braintree Hosted Fields using Flask to make a Credit Card or PayPal payment. This is combined with UI dropdown of the braintree javascript + docker

## Technology

This demo uses

* Python 2.7+
* The [flask](http://flask.pocoo.org/) web framework
* braintree
* docker

## Demo

* For example fill in the following credentials:
  * Number: `4111 1111 1111 1111`
  * CVV: `123`
  * Expiration date: `11/2020`
* Click submit

or you can sign in using your PayPal Sandbox account

## Running the demo locally

* Run `pip install flask` to install flask
* Run `pip install braintree` to install braintree 
* Run `Python app.py` in the root project folder to run the server 
* Visit `http://127.0.0.1:5000/` in your browser
* Proceed as above

## build your docker image with Jenkins file for automation
1) Set up jenkins (docker run of jenkins or you can install manually)[https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-16-04]
2) go to localhost:8080 
3) sudo cat /var/lib/jenkins/secrets/initialAdminPassword
4) key in passphrase into localhost:8080 from part 3
5) create admin user
6) Set up jenkins server as per: https://getintodevops.com/blog/building-your-first-docker-image-with-

## Using Notary to sign docker images
1) Do a docker pull of notary
2) git clone https://github.com/theupdateframework/notary.git
3) cd notary 
4) docker-compose build
5) docker-compose up -d
6) mkdir -p ~/.notary && cp cmd/notary/config.json cmd/notary/root-ca.crt ~/.notary
7) Cp ~/.notary/ ~/usr/local/ca-certificates
8) cd to ca-certificate and execute update-ca-certificate
9) service docker restart


