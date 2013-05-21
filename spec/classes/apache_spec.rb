require 'spec_helper'

describe 'apache' do
  let(:facts) { default_test_facts }

  it do
    should include_class("apache::config")
    should include_class("apache::homebrew::apache")

    should contain_file('/System/Library/LaunchDaemons/org.apache.httpd.plist').with({
      :group  => 'wheel',
      :owner  => 'root',
      :notify => 'Service[org.apache.httpd]',
    })

    should contain_file('/etc/apache2').with_ensure('directory')
    should contain_file('/var/log/apache2').with_ensure('directory')
    should contain_file('/etc/apache2/sites').with_ensure('directory')

    should contain_file('/etc/apache2/httpd.conf').
      with_notify('Service[org.apache.httpd]')

    should contain_service('org.apache.httpd').with({
      :ensure => 'running',
      :require => 'File[/etc/apache2/httpd.conf]',
    })
  end
end
