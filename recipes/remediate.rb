#
# Cookbook Name:: cve-2014-7169
# Recipe:: remediate
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


if node['languages']['bash']['shellshock_vulnerable']

  package 'bash' do
    action :upgrade
  end

  # Can't just reload the ohai plugin because it will use the same
  # potentially compromised shell as the original run
  execute "test_shellshock" do
    user "root"
    cwd "/tmp"
    command "bash -c \"env x='() { :;}; echo Your bash is very likely vulnerable as this exited 0. Non-vulnerable bash will exit 1' bash -c 'echo this is a test' | grep 'Your bash' > /dev/null 2>&1\""
    returns [1]
    ignore_failure true
    notifies :run, "ruby_block[update_attribute]", :immediately
  end

end

ruby_block "update_attribute" do
  block do
    node.default['languages']['bash']['shellshock_vulnerable'] = 'false'
  end
  action :nothing
end


log "End of Remediate recipe: The shellshock_vulnerable variable is now #{node['languages']['bash']['shellshock_vulnerable']}"
