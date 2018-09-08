#
# Cookbook:: ssh
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Start e Enable do servico SSH Server
service 'sshd' do
  action [:enable,:start]
  supports :reload => true
end

# Arquivo de configuracao do daemon
#node["ssh"].each do |data|
#  template "/etc/ssh/sshd_config" do
#  source "sshd_config.erb"
#  mode "0644"
#  variables(port: node["ssh"]["port"])  
#  notifies :restart, "service[sshd]"
#end

template '/etc/ssh/sshd_config' do
  source 'sshd_config.erb'
  owner 'root'
  mode '0644'
  variables( :port => node['openssh']['server']['port'] )
  notifies :restart, 'service[sshd]'
end
