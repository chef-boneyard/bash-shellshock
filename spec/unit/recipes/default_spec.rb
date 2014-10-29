require 'spec_helper'

describe 'cve-2014-7169::default' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new
    runner.node.set['languages']['bash']['shellshock_vulnerable'] = 'true'
    runner.converge(described_recipe)
  end

  it 'sets the default attributes correctly' do
    expect(chef_run.node['ohai']['plugins']['cve-2014-7169']).to \
    eq('plugins')
  end

  it 'includes the audit recipe' do
    expect(chef_run).to include_recipe('cve-2014-7169::audit')
  end

  it 'includes the remediate recipe' do
    expect(chef_run).to include_recipe('cve-2014-7169::remediate')
  end
end
