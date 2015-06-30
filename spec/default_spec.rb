require 'spec_helper'

describe 'bsdznc::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'installs the znc server' do
    expect(chef_run).to install_znc('default')
  end

  it 'creates the ssl certificate' do
    expect(chef_run).to create_certificate_manage('znc')
  end

  it 'starts the znc server' do
    expect(chef_run).to start_znc('default')
  end
end
