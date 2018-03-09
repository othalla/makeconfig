require 'spec_helper'

describe 'makeconfig' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "makeconfig class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('makeconfig::params') }
          it { is_expected.to contain_class('makeconfig::install').that_comes_before('makeconfig::config') }
          it { is_expected.to contain_class('makeconfig::config') }
          it { is_expected.to contain_class('makeconfig::service').that_subscribes_to('makeconfig::config') }

          it { is_expected.to contain_service('makeconfig') }
          it { is_expected.to contain_package('makeconfig').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'makeconfig class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('makeconfig') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
