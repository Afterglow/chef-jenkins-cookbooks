#
# Cookbook Name:: jenkins-cookbooks
# Recipe:: default
#
# Copyright 2013, Dyn Inc
#
# Apache 2.0 License
#

include_recipe "jenkins-cookbooks::github"

get_repo_list(node['github'], ['cookbooks']).each do |repo|
  job_name = repo.name
  job_config = File.join(node['jenkins']['server']['home'], "#{job_name}-config.xml")

  jenkins_job job_name do
    source "job-config.xml.erb"
    variables :repo => repo,
              :jenkinsurl => node['jenkins']['server']['url']
    notifies :update, resources(:jenkins_job => job_name), :immediately
  end
end
