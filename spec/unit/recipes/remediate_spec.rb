require 'spec_helper'

describe 'bash-shellshock::remediate' do
  context 'when the [\'languages\'][\'bash\'][\'shellshock_vulnerable\'] '\
          'attribute is true' do

    let(:chef_run) do
      runner = ChefSpec::Runner.new
      runner.node.set['languages']['bash']['shellshock_vulnerable'] = true
      runner.converge(described_recipe)
    end

    it 'upgrades the bash package' do
      expect(chef_run).to upgrade_package('bash')
    end

    it 'runs the reload_ohai ruby_block' do
      expect(chef_run).to run_ruby_block('reload_ohai')
    end

  end

  context 'when the [\'languages\'][\'bash\'][\'shellshock_vulnerable\'] '\
          'attribute is false' do

    let(:chef_run) do
      runner = ChefSpec::Runner.new
      runner.node.set['languages']['bash']['shellshock_vulnerable'] = false
      runner.converge(described_recipe)
    end

    it 'does not upgrade the bash package' do
      expect(chef_run).not_to upgrade_package('bash')
    end

    it 'does not run the reload_ohai ruby_block' do
      expect(chef_run).not_to run_ruby_block('reload_ohai')
    end

  end
end
