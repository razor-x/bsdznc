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

  it 'enables and loads the portacl module' do
    expect(chef_run).to create_directory('/etc/rc.conf.d')
    expect(chef_run).to create_file('/etc/rc.conf.d/mac_portacl.conf')
    expect(chef_run).to run_execute('kldload -n mac_portacl.ko')
  end

  it 'allows znc to bind to reserved ports' do
    expect(chef_run).to(
      apply_sysctl_param('net.inet.ip.portrange.reservedhigh')
      .with(value: 0))
    expect(chef_run).to(
      apply_sysctl_param('security.mac.portacl.enabled')
      .with(value: 1))
    expect(chef_run).to(
      apply_sysctl_param('security.mac.portacl.suser_exempt')
      .with(value: 1))
    expect(chef_run).to(
      apply_sysctl_param('security.mac.portacl.rules')
      .with(value: 'uid:194:tcp:194,uid:194:tcp:443'))
  end

  it 'enables znc' do
    expect(chef_run).to enable_service('znc')
  end
end

describe 'bsdznc_test::start' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'starts znc' do
    expect(chef_run).to start_service('znc')
  end
end

describe 'bsdznc_test::stop' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'stops znc' do
    expect(chef_run).to stop_service('znc')
  end
end

describe 'bsdznc_test::restart' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'stops and starts znc' do
    expect(chef_run).to stop_service('znc')
    expect(chef_run).to start_service('znc')
  end
end

describe 'bsdznc_test::destroy' do
  cached(:chef_run) do
    ChefSpec::ServerRunner.new(step_into: ['bsdznc'])
      .converge(described_recipe)
  end

  it 'stops and disables znc' do
    expect(chef_run).to disable_service('znc')
    expect(chef_run).to stop_service('znc')
  end

  it 'returns the portacl rules to default' do
    expect(chef_run).to(
      apply_sysctl_param('security.mac.portacl.enabled')
      .with(value: 0))
    expect(chef_run).to(
      apply_sysctl_param('net.inet.ip.portrange.reservedhigh')
      .with(value: 1023))
    expect(chef_run).to remove_sysctl_param('security.mac.portacl.enabled')
  end

  it 'disables the portacl module' do
    expect(chef_run).to delete_file('/etc/rc.conf.d/mac_portacl.conf')
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
