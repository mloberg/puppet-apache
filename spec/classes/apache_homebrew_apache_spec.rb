require 'spec_helper'

describe 'apache::homebrew::apache' do
  let(:facts) { default_test_facts }

  it do
    should contain_file('/Applications/Xcode.app/Contents/Developer/Toolchains/OSX10.8.xctoolchain').with({
      :ensure => 'link',
      :source => '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain',
      :owner  => 'root',
      :group  => 'wheel',
    })
  end
end
