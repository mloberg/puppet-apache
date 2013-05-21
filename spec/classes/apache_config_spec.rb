require 'spec_helper'

describe 'apache::config' do
  let(:facts) { default_test_facts }

  it do
    should include_class("boxen::config")
  end
end
