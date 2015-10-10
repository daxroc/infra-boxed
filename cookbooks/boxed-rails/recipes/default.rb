#
# Cookbook Name:: boxed-rails
# Recipe:: default
#
# Copyright (c) 2015 Damien Roche, All Rights Reserved.

deploy = '/srv/boxed-app'
app_repo = 'https://github.com/daxroc/boxed-app.git'
user = 'webapps'
group = 'webapps'

#
include_recipe 'boxed-rails::users'
include_recipe 'boxed-rails::build_essential'


directory deploy do
  user user
  group group
  action :create
  recursive true
end

# Enable EPEL 
include_recipe 'yum-epel'

package 'nodejs'
package 'git'

# Source code checkout
git deploy do
  repository app_repo
  user user
  group group
end


# Database
package 'sqlite-devel'

# Application setup/config
application deploy do
#  user user
#  group group
  bundle_install do
    deployment true
    without %w{development test}
  end
  rails do
    database 'sqlite3:///db.sqlite3'
    secret_token 'd78fe08df56c9'
    migrate true
  end
  unicorn do
    port 8000
    action [:start, :enable]
  end
end
