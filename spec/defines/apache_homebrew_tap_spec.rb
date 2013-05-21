require 'spec_helper'

describe 'apache::homebrew::tap' do
  let(:facts) { default_test_facts }
  let(:title) { 'foobar' }

  find = "brew tap | grep foobar"

  it do
    should contain_exec("homebrew_tap_foobar").with({
      :command => "brew tap foobar",
      :unless  => find,
    })
  end

  context 'with ensure => absent' do
    let(:params) { {:ensure => 'absent'} }

    it do
      should contain_exec("homebrew_untap_foobar").with({
        :command => "brew untap foobar",
        :onlyif => find,
      })
    end
  end
end
