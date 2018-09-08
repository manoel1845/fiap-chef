#
# Cookbook:: adminuser
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#

user 'ctouser' do
  comment 'CTO Administrator User'
#  uid '1050'
#  gid '1050'
  home '/home/ctouser'
  shell '/bin/bash'
  password '$1$G1N8n5Ol$P/g9X9eG/RoXlDxyJWxy6.'
end

group 'sudo' do
  action :modify
  members 'ctouser'
  append true
end
