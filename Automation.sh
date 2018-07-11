#!/bin/bash
sudo mkdir -p files
cd files
git clone https://github.com/docker/notary.git
git clone https://github.com/leeadh/braintree_example.git

#check if notary server is up
if [ "$(docker ps -q -f name=notary_server)" ]; 
then
	cd braintree_example && docker build -t iad.ocir.io/darrelchia/samplerepo:signedtest .&& docker push iad.ocir.io/darrelchia/samplerepo:signedtest
else
	# image has been built
	cd notary && docker-compose up -d
	cd ..
	cd braintree_example && docker build -t iad.ocir.io/darrelchia/samplerepo:signedtest .&& docker push iad.ocir.io/darrelchia/samplerepo:signedtest
	
fi
