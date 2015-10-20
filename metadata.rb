name              'bash-shellshock'
maintainer        'Chef Software, Inc.'
maintainer_email  'cookbooks@chef.io'
license           'Apache 2.0'
description       'Audits & remediates the Shellshock vulnerability'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '1.0.1'
recipe            'bash-shellshock::default', 'Audits & remediates cve-2014-7169 (Shellshock)'
recipe            'bash-shellshock::audit', 'Audits nodes for cve-2014-7169 (Shellshock)'
recipe            'bash-shellshock::remediate', 'Audits & remediates cve-2014-7169 (Shellshock)'

depends 'ohai', '~> 2.0'

%w(centos debian fedora freebsd gentoo redhat scientific oracle ubuntu ).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/bash-shellshock' if respond_to?(:source_url)
issues_url 'https://github.com/chef-cookbooks/bash-shellshock/issues' if respond_to?(:issues_url)
