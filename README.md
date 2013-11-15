jenkins-cookbooks
=================
This cookbook iterates a Github enterprise organisation containing 
cookbooks and creates jobs for them on a Jenkins server

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
