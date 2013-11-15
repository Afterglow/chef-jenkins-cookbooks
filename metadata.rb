name              'jenkins-cookbooks'
maintainer        'Dyn Inc'
maintainer_email  'pthomas@dyn.com'
license           'Apache 2.0'
description       'Creates jobs in Jenkins to build cookbooks from a Github repository'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md')
version           '0.0.1'

depends 'jenkins', '= 0.8.0'

supports 'ubuntu'
