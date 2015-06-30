require 'spec_helper'

describe 'bsdznc::default' do
  describe package('znc') do
    it { should be_installed }
  end

  describe user('znc') do
    it { should exist }
    it { should have_uid 194 }
    it { should have_home_directory '/nonexistent' }
    it { should have_login_shell '/usr/sbin/nologin' }
  end

  describe group('znc') do
    it { should exist }
    it { should have_gid 194 }
  end

  describe service('znc') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(194) do
    it { should be_listening }
  end

  describe port(443) do
    it { should be_listening }
  end
end
