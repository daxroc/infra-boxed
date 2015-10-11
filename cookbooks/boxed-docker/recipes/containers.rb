#
# Cookbook Name:: boxed-docker
# Recipe:: containers
#
# Copyright (c) 2015 Damien Roche, All Rights Reserved.

docker_image 'docker.io/ubuntu' do
  tag 'wily'
  action :pull
end

docker_image 'docker.io/centos' do
  tag '7'
  action :pull
end
