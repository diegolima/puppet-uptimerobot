require 'spec_helper'
describe 'uptimerobot' do

  context 'with defaults for all parameters' do
    it { should contain_class('uptimerobot') }
  end
end
