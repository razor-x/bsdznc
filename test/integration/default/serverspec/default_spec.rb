require 'spec_helper'

describe 'bsdznc::default' do
  describe command('ls -al /') do
    its(:stdout) { should match(/bin/) }
  end
end
