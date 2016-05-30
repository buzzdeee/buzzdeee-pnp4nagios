require 'spec_helper'
describe 'pnp4nagios' do

  context 'with defaults for all parameters' do
    it { should contain_class('pnp4nagios') }
  end
end
