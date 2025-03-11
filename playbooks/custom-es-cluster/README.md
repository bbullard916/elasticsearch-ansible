# Custom ElasticStack Cluster

In all examples in this directory:

* Execute Vagrant up to provision VM's you will need to ensure a private network is created in host network manager
* Once your VM's are all stood up run the run-ansible.sh script to install 3 master nodes, 3 data nodes), 2 kibana instances, 2 logstash instances.

You can use the private/pub keys or generate your own just know you need to put you pub key in the Vagrantfile in the root of the repo. 
