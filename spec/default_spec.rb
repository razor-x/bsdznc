require 'spec_helper'

describe 'bsdznc::default' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |_, server|
      server.create_data_bag('users', 'sudoroot' => {})
    end.converge(described_recipe)
  end

  before(:each) do
    stub_command('which sudo')
  end

  it 'includes the cafe-core::default recipe' do
    expect(chef_run).to include_recipe('cafe-core::default')
  end

  it 'includes the bsdznc::znc recipe' do
    expect(chef_run).to include_recipe('bsdznc::znc')
  end
end
