require 'spec_helper'

unless ENV['SKIP_VAGRANT_TESTS']
  describe file('/home/vagrant/.ssh/config') do
    it { should exist }
  end

  describe file('/home/vagrant/.gitconfig') do
    it { should exist }
  end

  describe file('/home/vagrant/.ssh/id_rsa') do
    it { should exist }
    it { should be_mode 600 }
    it { should be_owned_by 'vagrant' }
  end
end

describe command('whoami') do
  its(:stdout) { should match 'vagrant' }
end
