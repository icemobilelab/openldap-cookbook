execute 'ldapadd' do
  command "ldapadd -x -D cn=admin,#{node['openldap_mm']['basedn']} -w #{node['openldap_mm']['clearpw']} -f #{node['openldap_mm']['dir']}/base.ldif -H ldap://localhost"
  user 'root'
  action :nothing
end

template "#{node['openldap_mm']['dir']}/base.ldif" do
  source 'main_ldif.erb'
  mode 0640
  owner 'root'
  group 'root'
  notifies :run, 'execute[ldapadd]'
end