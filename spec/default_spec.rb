require 'spec_helper'

describe 'bsdznc::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }
end
