require 'spec_helper'
require 'stub/ec2'

describe ec2('i-ec12345a') do
  it { should exist }
  it { should be_running }
  it { should_not be_stopped }
  its(:instance_id) { should eq 'i-ec12345a' }
  its(:image_id) { should eq 'ami-abc12def' }
  its(:public_ip_address) { should eq '123.0.456.789' }
  its(:private_ip_address) { should eq '10.0.1.1' }
  it { should have_security_group('sg-1a2b3cd4') }
  it { should have_security_group('my-security-group-name') }
  it { should have_security_group('my-security-group-tag-name') }
  it { should belong_to_vpc('vpc-ab123cde') }
  it { should belong_to_vpc('my-vpc') }
  it { should belong_to_subnet('subnet-1234a567') }
  it { should belong_to_subnet('my-subnet') }
  it { should have_eip }
  it { should have_eip('123.0.456.789') }
end

describe ec2('my-ec2') do
  it { should exist }
  it { should be_running }
end
