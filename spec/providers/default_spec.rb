require 'spec_helper'

describe 'bsdznc_test::create' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'installs znc' do
    expect(chef_run).to install_package('znc')
  end

  it 'creates the znc user and group' do
    expect(chef_run).to create_user('znc').with(system: true)
    expect(chef_run).to create_group('znc').with(system: true)
  end

  it 'creates the configs directory' do
    expect(chef_run).to create_directory('/usr/local/etc/znc/configs')
  end

  context 'when no existing configuration' do
    before(:each) do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:exist?)
        .with('/usr/local/etc/znc/configs/znc.conf').and_return(true)
    end

    it 'does not overwrite the current configuration' do
      expect(chef_run).to_not create_template(
        '/usr/local/etc/znc/configs/znc.conf')
    end
  end

  context 'when no existing configuration' do
    before(:each) do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:exist?)
        .with('/usr/local/etc/znc/configs/znc.conf').and_return(false)
    end

    it 'creates the default configuration' do
      expect(chef_run).to create_template(
        '/usr/local/etc/znc/configs/znc.conf')
    end
  end

  it 'enables and starts znc' do
    expect(chef_run).to enable_service('znc')
    expect(chef_run).to start_service('znc')
  end
end

describe 'bsdznc_test::start' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'starts znc' do
    expect(chef_run).to start_service('znc')
  end
end

describe 'bsdznc_test::stop' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'stops znc' do
    expect(chef_run).to stop_service('znc')
  end
end

describe 'bsdznc_test::destroy' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'stops and disables znc' do
    expect(chef_run).to disable_service('znc')
    expect(chef_run).to start_service('znc')
  end

  it 'removes the znc user and group' do
    expect(chef_run).to remove_user('znc')
    expect(chef_run).to remove_group('znc')
  end

  it 'deletes the znc configuration directory' do
    expect(chef_run).to delete_directory('/usr/local/etc/znc')
  end

  it 'removes znc' do
    expect(chef_run).to remove_package('znc')
  end
end
