require 'spec_helper'

packages = %w[
  telnet
  speedtest-cli
  wget
  nmap
  tree
  aria2
  unzip
  curl
  virtualbox
  git
  jq
  whois
  dnsutils
  net-tools
]

packages.each do |p|
  describe package(p) do
    it { should be_installed.by(:apt) }
  end
end

commands = [
  'speedtest -h',
  'wget --help',
  'nmap --version',
  'tree --version',
  'aria2c --version',
  'unzip --help',
  'curl --help',
  'git --help',
  'jq --help',
  'whois --version',
  'dig -v'
  # 'netstat --help' both help and version return errors
]

commands.each do |c|
  describe command(c) do
    its(:exit_status) { should eq 0 }
  end
end
