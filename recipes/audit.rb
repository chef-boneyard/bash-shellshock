#
# Cookbook Name:: bash-shellshock
# Recipe:: audit
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

# Install the shellshock ohai plugin to add ['languages']['bash']
# to OHAI-collected data

include_recipe 'ohai::default'

log 'ShellShock Audit Warning' do
  message "\n\n##############################################################################\n       # This host is vulnerable to ShellShock!  Please remediate!                  #\n       ##############################################################################"
  only_if { node['languages']['bash']['shellshock_vulnerable'] }
  level :info
end
