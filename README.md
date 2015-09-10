bash-shellshock Cookbook
=================

[![Build Status](https://travis-ci.org/chef-cookbooks/bash-shellshock.svg?branch=master)](http://travis-ci.org/chef-cookbooks/bash-shellshock)
[![Cookbook Version](https://img.shields.io/cookbook/v/bash-shellshock.svg)](https://supermarket.chef.io/cookbooks/bash-shellshock)

This cookbook is designed to test and optionally remediate the bash "shellshock" bug, more formally known as cve-2014-7169.

Once Chef-client has executed this recipe on one or more hosts, a list of all nodes that are vulnerable to the "Shellshock" exploit can be retrieved from the Chef server via `knife search:`

`knife search node 'bash:shellshock_vulnerable'`

Limitations
------------
This cookbook relies on the OS-native packaging system to provide patched versions of the bash package.

Requirements
------------

### Platform:

* Tested on CentOS 6.5
* Tested on Ubuntu 12.04
* Should work on a wide variety of other systems

### Cookbook Dependencies:

* ohai (https://supermarket.getchef.com/cookbooks/ohai)

Attributes
----------

* No user-configurable attributes

Recipes
-------

### bash-shellshock::default

* Audits and remediates Bash-CVE-2014-7169 ("Shellshock")

### bash-shellshock::audit

* Installs an OHAI plugin that will automatically audit nodes for the Shellshock vulnerability. This plugin creates two new values in OHAI:

  node['languages']['bash']['version'], a string. Returned from `bash --version`.  
  node['languages']['bash']['shellshock_vulnerable'], a boolean. True if node is vulnerable.

### bash-shellshock::remediate

* If the node is marked vulnerable by the audit recipe, this recipe will attempt to upgrade bash via the native packaging system. Includes the audit recipe.
* Audits and remediates Bash-CVE-2014-7169 ("Shellshock")

Testing
-------

### Chefspec
* Includes a Chefspec suite. This can be run with rspec.

### Test Kitchen / Serverspec
* Includes Test-kitchen support for Ubuntu 12.04 and Centos 6.5 operating systems. The .kitchen.yml file defaults to the Vagrant driver. Universal Serverspec tests valid for both operating systems are included.

License & Authors
-----------------

Author:: Charles Johnson (charles@chef.io)  
Author:: Nicolas Rycar (nrycar@chef.io)  
Author:: Julian Dunn (jdunn@chef.io)

```text
Copyright:: 2014-2015, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
