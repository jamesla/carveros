require 'spec_helper'

describe file('/usr/local/bin/st') do
  it { should exist }
end
