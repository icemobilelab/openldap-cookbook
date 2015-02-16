#!/bin/bash

echo "Deploying"
curl -s -o use-ruby https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/ruby/use-ruby
RUBY_VERSION=2.1.2 . ./use-ruby

openssl enc -d -aes-256-cbc -k $KNIFE_ENC_KEY -in deploy.enc -out deploy.pem

COOKBOOK=$(awk -F\' '{print $2;}' metadata.rb | head -1)

gem install --conservative bundler
bundle install
berks install
berks upload --only=deps # Upload dependencies only; they are automatically ignored when frozen
berks package
tar -zxf cookbooks-*.tar.gz

# Depending on job settings either upload the cookbook to Chef Server and freeze it, or keep it the same
if [ $FREEZE == "true" ]
then
    knife cookbook upload $COOKBOOK --environment $COOKBOOKENV --freeze
else
    knife cookbook upload $COOKBOOK --environment $COOKBOOKENV
fi
