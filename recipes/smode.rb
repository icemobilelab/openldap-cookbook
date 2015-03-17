#
# Author:: Syam Sampatsing (syam@icemobile.com)
# Cookbook Name:: openldap_mm
# Recipe:: single
#
# Copyright 2014, IceMobile.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package 'openldap' do
  action :upgrade
end

package 'openldap-servers' do
  action :upgrade
end

package 'openldap-clients' do
  action :upgrade
end

package 'openssl' do
  action :upgrade
end

directory "#{node['openldap_mm']['dir']}/slapd.d" do
  recursive true
  action :delete
  not_if { ::File.exist?("#{node['openldap_mm']['dir']}/.cleaned") }
end

directory "#{node['openldap_mm']['dir']}/slapd.d" do
  recursive true
  owner 'ldap'
  group 'ldap'
  action :create
end

execute 'clean-database-copy' do
  command 'cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG'
  user 'ldap'
  action :run
  not_if { ::File.exist?('/var/lib/ldap/DB_CONFIG') }
end

execute 'slapd-config-convert-touch' do
  command "touch #{node['openldap_mm']['dir']}/.cleaned"
  user 'root'
  action :nothing
end

execute 'slapd-config-convert' do
  command "slaptest -f #{node['openldap_mm']['dir']}/slapd.conf -F #{node['openldap_mm']['dir']}/slapd.d/"
  user 'ldap'
  action :nothing
  notifies :start, 'service[slapd]', :immediately
  notifies :run, 'execute[slapd-config-convert-touch]'
end

template "#{node['openldap_mm']['dir']}/slapd.conf" do
  source 'slapd.conf.erb'
  mode 0640
  owner 'ldap'
  group 'ldap'
  notifies :stop, 'service[slapd]', :immediately
  notifies :run, 'execute[slapd-config-convert]'
  not_if { ::File.exist?("#{node['openldap_mm']['dir']}/.cleaned") }
end

template '/etc/rsyslog.d/ldap.conf' do
  source 'rsyslog-ldap.erb'
  mode 0644
  owner 'root'
  group 'root'
  notifies :restart, 'service[rsyslog]', :immediately
end

service 'rsyslog' do
  action :nothing
end

service 'slapd' do
  action [:enable, :start]
end
