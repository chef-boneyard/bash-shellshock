name              'bash-shellshock'
maintainer        'Chef Software, Inc.'
maintainer_email  'support@getchef.com'
license           'Apache 2.0'
description       'Installs/configures something'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.0.0'
recipe            'bash-shellshock::default', 'Audits & remediates cve-2014-7169 (Shellshock)'
recipe            'bash-shellshock::audit', 'Audits nodes for cve-2014-7169 (Shellshock)'
recipe            'bash-shellshock::remediate', 'Audits & remediates cve-2014-7169 (Shellshock)'

depends 'ohai'

supports 'centos'
supports 'ubuntu'
