require 'spec_helper'

describe 'apache::vhost' do
  let(:facts) { default_test_facts }
  let(:title) { 'foobar' }

  it do
    should include_class("apache")

    should contain_file('/etc/apache2/sites/foobar.conf')
      .with_content(/^\s*DocumentRoot "\/test\/boxen\/src\/foobar"$/)
  end
end
