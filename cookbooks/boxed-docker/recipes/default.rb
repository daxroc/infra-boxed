#
# Cookbook Name:: boxed-docker
# Recipe:: default
#
# Copyright (c) 2015 Damien Roche, All Rights Reserved.

include_recipe 'yum-epel'
include_recipe 'boxed-docker::console'
include_recipe 'boxed-docker::docker'
include_recipe 'boxed-docker::containers'
