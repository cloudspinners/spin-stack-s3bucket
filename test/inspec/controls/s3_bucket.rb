# encoding: utf-8

title 'vpc'

bucket_base_name = attribute('bucket_base_name', description: 'Base name of the bucket')
aws_account_id = attribute('aws_account_id', description: 'AWS account id used in bucket name')

s3_bucket_name = "#{bucket_base_name}-#{aws_account_id}"

describe aws_s3_bucket(bucket_name: s3_bucket_name) do
  it { should exist }
  it { should_not be_public }
end
