#
# Cookbook Name:: cve-2014-7169
# Recipe:: audit
#
# Copyright (C) 2014 CHEF Software, Inc. <support@getchef.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install/configure something here
# Replace this with meaningful resources

include_recipe 'ohai::default'

if node['languages']['bash']['shellshock_vulnerable']
  ::Chef::Log.fatal('This host is vulnerable to cve-2014-7169')
end

log "End of Audit recipe: The shellshock_vulnerable variable is now #{node['languages']['bash']['shellshock_vulnerable']}"
