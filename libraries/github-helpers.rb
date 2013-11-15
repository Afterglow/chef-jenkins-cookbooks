class Chef::Recipe

  # Create an configure an instance of Github based on the attributes
  def config_github (gh)
    # It is important this require happen here AFTER the gem
    # has been installed during the compilation phase
    require 'github_api'
    github = Github.new do |config|
      Chef::Log.debug("Logging into github API at #{gh['endpoint']}")
      config.oauth_token = gh['oauth']
      config.site = gh['site']
      config.endpoint = gh['endpoint']
      config.ssl = {:verify => gh['ssl_verify']}
    end
    return github
  end

  # Get a list of all repos in orgs[] and return it
  def get_repo_list (gh, orgs)
    github = self.config_github(gh)
    repolist = []
    for eachorg in orgs do
      repolist.concat(github.repos.list :org => eachorg, :per_page => 100)
    end
    return repolist
  end

end

