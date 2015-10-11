#
# Cookbook Name:: boxed-docker
# Recipe:: default
#
# Copyright (c) 2015 Damien Roche, All Rights Reserved.

include_recipe 'yum-epel'

package 'docker-io' do
  action :install
end

service 'docker' do
  action [:enable, :start]
end

