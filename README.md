Skeleton Cookbook
=================

This cookbook is designed to test and optionally remediate the bash
"shellshock" bug, more formally known as cve-2014-7169.

Requirements
------------

### Platform:

* Tested on CentOS 6.5
* Tested on Ubuntu 12.04

### Cookbooks:

* chef_handler

Attributes
----------

*List attributes here*

Recipes
-------

### cve-2014-7169::default

* Audits and remediates cve-2014-7169 ("Shellshock")

### cve-2014-7169::audit

* Installs an OHAI plugin that will automatically audit nodes for the Shellshock vulnerability, and sets a node attribute marking the node as vulnerable.

### cve-2014-7169::remediate

* If the node is marked vulnerable by the audit recipe, this recipe will attempt to upgrade bash via the native packaging system. Includes the audit recipe.



License and Author
------------------

Author:: Chef Software, Inc (support@getchef.com)

Copyright:: 2014, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
