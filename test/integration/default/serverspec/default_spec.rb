require 'spec_helper'

describe 'cve-2014-7169::default' do

  describe file('/etc/chef/ohai_plugins/bash.rb') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
  end

  bash_command = 'bash -c "env x=\'() { :;}; echo Your bash is very likely '\
                 'vulnerable as this exited 0. Non-vulnerable bash will exit '\
                  '1\' bash -c \'echo this is a test\' | grep \'Your bash\' '\
                  '> /dev/null 2>&1"'

  describe command(bash_command) do
    its(:exit_status) { should eq 1 }
  end

end
