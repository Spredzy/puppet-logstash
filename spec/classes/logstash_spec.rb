# spec/classes/logstash_spec.rb

require 'spec_helper'

describe 'logstash' do

  context 'when Debian' do

    let(:facts) do
      {:osfamily => 'Debian'}
    end

    it 'install debian_testing repo' do
      should contain_class('apt')
    end

    it 'install java 1.7' do
      should contain_package('openjdk-7-jdk')
    end

    it 'install java-service-wrapper' do
      should contain_class('java_service_wrapper')
    end

  end

  context 'when CentOS' do

    let(:facts) do
      {:osfamily => 'RedHat'}
    end

    it 'install jpackage repo' do
      should contain_class('jpackage')
    end

    it 'install java 1.7' do
      should contain_package('java-1.7.0-openjdk')
    end

    it 'install java-service-wrapper' do
      should contain_class('java_service_wrapper')
    end

  end

end
