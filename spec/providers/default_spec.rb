require 'spec_helper'

describe 'bsdznc_test::create' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'installs znc' do
    expect(chef_run).to install_package('znc')
  end
end

describe 'bsdznc_test::start' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end
end

describe 'bsdznc_test::stop' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end
end

describe 'bsdznc_test::destroy' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'removes znc' do
    expect(chef_run).to remove_package('znc')
  end
end
