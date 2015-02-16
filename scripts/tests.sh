#!/bin/bash

echo "Running Tests"
curl -s -o use-ruby https://repository-cloudbees.forge.cloudbees.com/distributions/ci-addons/ruby/use-ruby
RUBY_VERSION=2.1.2 . ./use-ruby

gem install --conservative bundler
bundle install
rake style
rake spec
