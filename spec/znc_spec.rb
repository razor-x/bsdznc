require 'spec_helper'

describe 'bsdznc::znc' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'creates the znc server' do
    expect(chef_run).to configure_znc('default')
  end
end
