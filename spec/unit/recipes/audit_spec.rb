require 'spec_helper'

describe 'cve-2014-7169::audit' do
  let(:chef_run) do
    runner = ChefSpec::Runner.new
    runner.converge(described_recipe)
  end

  it 'includes the ohai recipe' do
    expect(chef_run).to include_recipe('ohai::default')
  end
end
