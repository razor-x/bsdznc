require 'spec_helper'

describe 'bsdznc::znc' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'creates the znc server' do
    expect(chef_run).to configure_znc('default')
  end

  it 'creates the ssl certificate' do
    expect(chef_run).to create_certificate_manage('znc')
  end
end
