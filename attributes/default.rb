#
# Author:: Syam Sampatsing (syam@icemobile.com)
# Cookbook Name:: openldap_mm
# Recipe:: default
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

default['openldap_mm']['servername'] = node['fqdn']
default['openldap_mm']['server1'] = nil
default['openldap_mm']['server2'] = nil

default['openldap_mm']['domain'] = 'foobar'
default['openldap_mm']['basedn'] = 'dc=foobar,dc=bar'
default['openldap_mm']['tls_enabled'] = false
default['openldap_mm']['port'] = '389'

default['openldap_mm']['clearpw'] = 'foobarpassword'

default['openldap_mm']['dir'] = '/etc/openldap'
default['openldap_mm']['mode'] = 'mm'

default['openldap_mm']['ssl_cert'] = nil
default['openldap_mm']['ssl_key'] = nil
default['openldap_mm']['cafile'] = nil

default['openldap_mm']['admin_ou'] = 'ou=Admins'
default['openldap_mm']['group_ou'] = 'ou=Groups'
default['openldap_mm']['user_ou'] = 'ou=Users'
