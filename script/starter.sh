#!/bin/bash
# sudo /etc/init.d/sensu-client start
rm -f tmp/pids/server.pid

# BACKGROUND=true rake solr_indexer:start_job
# rake assets:precompile
rails s -b '0.0.0.0' -p 3000
# cd engines && rails plugin new arzero --mountable --api -d postgresql
