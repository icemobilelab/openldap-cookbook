#
# Author:: Syam Sampatsing (syam@icemobile.com)
# Cookbook Name:: openldap_mm
# Recipe:: hosts
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
#
# This is only for kitchen to allow DNS to work!!!!!

hostsfile_entry '192.168.33.33' do
  hostname 'server1-centos-66.vagrantup.com'
  unique true
end

hostsfile_entry '192.168.33.34' do
  hostname 'server2-centos-66.vagrantup.com'
  unique true
end
