name 'openldap_mm'
maintainer 'Syam Sampatsing'
maintainer_email 'syam@icemobilecom'
license 'Apache v2.0'
description 'Installs OpenLdap MirrorMode-NWay'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
begin
  version IO.read(File.join(File.dirname(__FILE__), 'VERSION'))
rescue
  version '0.0.1'
end

%w( centos amazon ).each do |os|
  supports os
end
