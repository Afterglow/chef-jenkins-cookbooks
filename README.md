jenkins-cookbooks
=================
This cookbook is an example of how to iterate a Github enterprise organisation containing 
cookbooks and create jobs for them on a Jenkins server automatically. While it will work
standalone it is more designed to act as an example of how this can be done. The libraries
included were stripped from our internal CI configuration cookbook with example cookbooks, 
attributes and templates added for clarity.

Requirements
------------
### cookbooks
- `jenkins` - required for LWRPs

Attributes
----------

- `github.site` - The URL for the Github install
- `github.endpoint` - The API endpoint for the Github install
- `github.oauth` - An oauth token which the cookbook can use to access the API
- `github.orgs` - The list of organisations to use for creating jobs from

Recipes
-------
#### jenkins-cookbooks::default
Create jobs to build the cookbooks found in `github.orgs`
