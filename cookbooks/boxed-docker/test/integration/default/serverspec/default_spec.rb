require 'spec_helper'

describe 'boxed-docker::default' do

  describe yumrepo('epel') do
    it { should exist }
  end

end

describe 'boxed-docker::docker' do

  describe package('docker') do
    it { should be_installed }
  end
  
  describe service('docker') do
    it { should be_running }
    it { should be_enabled }
  end

end

describe 'boxed-docker::containers' do

  describe docker_container('docker.io/ubuntu:wily') do
    it { should exist }
  end

  describe docker_container('docker.io/centos:7') do
    it { should exist }
  end

end

describe 'boxed-docker::console' do
  
  describe package('tmux') do
    it { should be_installed }
  end

end
