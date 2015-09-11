require 'spec_helper'

describe 'bash-shellshock::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.node.set['languages']['bash']['shellshock_vulnerable'] = 'true'
    runner.converge(described_recipe)
  end

  it 'sets the default attributes correctly' do
    expect(chef_run.node['ohai']['plugins']['bash-shellshock']).to \
      eq('plugins')
  end

  it 'includes the audit recipe' do
    expect(chef_run).to include_recipe('bash-shellshock::audit')
  end

  it 'includes the remediate recipe' do
    expect(chef_run).to include_recipe('bash-shellshock::remediate')
  end
end
