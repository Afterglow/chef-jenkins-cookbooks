#
# Cookbook Name:: jenkins-cookbooks
# Recipe:: github
#
# Copyright 2013, Dyn Inc
#
# Apache 2.0 License
#

package "git" do
  action :install
end

chef_gem 'github_api' do
  action :install
end

# There has to be a better way of doing this but
# these packages are required to build the
# github_api gem and dependencies
%w[build-essential libxml2-dev libxslt1-dev].each do |pkg|
  p = package "#{pkg}" do
    action :nothing
  end
  p.run_action(:install)
end

# Now install the github API gem
apigem = chef_gem "github_api" do
  action :nothing
end
apigem.run_action(:install)
