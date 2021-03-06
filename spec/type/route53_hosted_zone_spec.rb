require 'spec_helper'
require 'stub/route53_hosted_zone'

describe route53_hosted_zone('example.com.') do
  it { should exist }
  its(:resource_record_set_count) { should eq 5 }
  it { should have_record_set('example.com.').a('123.456.7.890') }
  it { should have_record_set('example.com.').mx('10 mail.example.com') }
  it { should have_record_set('mail.example.com.').a('123.456.7.890').ttl(3600) }
  ns = 'ns-123.awsdns-45.net.
ns-6789.awsdns-01.org.
ns-2345.awsdns-67.co.uk.
ns-890.awsdns-12.com.'
  it { should have_record_set('example.com.').ns(ns) }
  it { should have_record_set('s3.example.com.').alias('s3-website-us-east-1.amazonaws.com.', 'Z2ABCDEFGHIJKL') }
end

describe route53_hosted_zone('Z1A2BCDEF34GH5') do
  it { should exist }
  its(:resource_record_set_count) { should eq 5 }
end
