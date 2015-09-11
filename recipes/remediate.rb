#
# Cookbook Name:: bash-shellshock
# Recipe:: remediate
#
# Copyright 2014-2015 Chef Software, Inc.
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

# Upgrade bash from package manager to latest version
package 'bash' do
  action :upgrade
  only_if { node['languages']['bash']['shellshock_vulnerable'] }
end

# Reload OHAI to provide correct data
ruby_block 'reload_ohai' do
  block do
    o = Ohai::System.new
    o.all_plugins
    node.automatic_attrs.merge! o.data
  end
  only_if do
    node['languages']['bash']['shellshock_vulnerable']
  end
end
