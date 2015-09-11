#
# Author:: Julian C. Dunn (<jdunn@chef.io>)
# Copyright:: Copyright (c) 2014, Chef Software, Inc.
# License:: Apache License, Version 2.0
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

Ohai.plugin(:Bash) do
  provides 'languages/bash'
  depends 'languages'

  def bash_version
    cmd = 'bash --version'
    shell_out(cmd).stdout.lines.first.strip
  end

  def bash_vulnerable?
    cmd = <<ENDCMD
      bash -c "env x='() { :;}; echo Your bash is very likely vulnerable as this exited 0. Non-vulnerable bash will exit 1' bash -c 'echo this is a test' | grep 'Your bash' > /dev/null 2>&1"
ENDCMD
    shell_out(cmd).status == 0
  end

  collect_data do
    languages[:bash] = Mash.new
    languages[:bash][:version] = bash_version
    languages[:bash][:shellshock_vulnerable] = bash_vulnerable?
  end
end
