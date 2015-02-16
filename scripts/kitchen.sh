#!/bin/bash

echo "Running Kitchen"
curl -s -o use-ruby https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/ruby/use-ruby
RUBY_VERSION=2.1.2 . ./use-ruby

gem install --conservative bundler
bundle install
rake integration:cloud
