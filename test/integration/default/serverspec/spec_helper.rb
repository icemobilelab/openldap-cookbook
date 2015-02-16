require 'serverspec'

# Required by serverspec
set :backend, :exec

RSpec.configure do |c|
  c.before :all do
    c.path = '$PATH:/sbin:/usr/sbin'
  end
end
