#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Instalacao do pacote apache
package 'apache2' do
  action :install
end

# Start e Enable do servico do apache
service 'apache2' do
  action [:enable,:start]
  supports :reload => true
end

# Configuracao dos Virtual Host
node['apache']['sites'].each do |sitename, data|
  document_root = "/var/www/html/#{sitename}"

  directory document_root do
    mode '0755'
    recursive true
  end

#  execute 'enable-vhosts' do
#    command "a2ensite #{sitename}.conf"
#    command "a2ensite *.conf"
#    action :nothing
#  end

  template "/etc/apache2/sites-available/#{sitename}.conf" do
    source 'virtualhosts.erb'
    mode '0644'
    variables(
      :document_root => document_root,
      :port => data['port'],
      :serveradmin => data['serveradmin'],
      :servername => data['servername'],
      :environment => data['environment']
    )
#    notifies :run, "execute[enable-vhosts]"
#    notifies :reload, 'service[apache2]'
  end

  execute 'enable-vhosts' do
    command "a2ensite #{sitename}.conf"
#    command "a2ensite *.conf"
    action :run
    notifies :reload, 'service[apache2]'
  end

  directory "/var/www/html/#{sitename}" do
    action :create
  end

  template "/var/www/html/#{sitename}/index.html" do
    source 'homepages.erb'
    mode '0644'
    variables(
      :servername => data['servername'],
      :environment => data['environment']
    )
  end
end
