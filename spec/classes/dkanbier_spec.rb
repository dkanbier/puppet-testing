require 'spec_helper'

describe 'dkanbier', :type => 'class' do

  context "On a Debian OS with no package name specified" do
    let :facts do
      {
        :osfamily => 'Debian'
      }
    end

    it {
      should contain_package('httpd').with( { 'name' => 'apache2' } )
      should contain_service('httpd').with( { 'name' => 'apache2' } )
    }
  end

  context "On a RedHat OS with no package name specified" do
    let :facts do
      {
        :osfamily => 'RedHat'
      }
    end

    it {
      should contain_package('httpd').with( { 'name' => 'httpd' } )
      should contain_service('httpd').with( { 'name' => 'httpd' } )
    }
  end

  context "On an unknown OS with no package name specified" do
    let :facts do
      {
        :osfamily => 'Darwin'
      }
    end

    it {
      expect { should raise_error(Puppet::Error) }
    }
  end

  context "With a package name specified" do
    let :params do
      {
        :package_name => 'apache'
      }
    end

    it {
      should contain_package('httpd').with( { 'name' => 'apache' } )
      should contain_service('httpd').with( { 'name' => 'apache' } )
    }
  end
end
