#
# Cookbook Name:: bsdznc
# Provider:: default
#
# Copyright 2015 Evan Sosenko
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def whyrun_supported?
  true
end

use_inline_resources

action :create do
  package 'znc' do
    action :install
  end

  user new_resource.user do
    system true
    action :create
  end

  group new_resource.group do
    system true
    action :create
  end

  directory "#{node['bsdznc']['config_path']}/configs" do
    user new_resource.user
    group new_resource.group
    mode '0750'
    recursive true
    action :create
  end

  template "#{node['bsdznc']['config_path']}/configs/znc.conf" do
    source 'znc.conf.erb'
    user new_resource.user
    group new_resource.group
    mode '0640'
    action :create
    not_if do
      ::File.exist?("#{node['bsdznc']['config_path']}/configs/znc.conf")
    end
  end

  service 'znc' do
    action :enable
  end
end

action :start do
  service 'znc' do
    action :start
  end
end

action :stop do
  service 'znc' do
    action :stop
  end
end

action :restart do
  service 'znc' do
    action [:stop, :start]
  end
end

action :destroy do
  service 'znc' do
    action [:stop, :disable]
  end

  directory node['bsdznc']['config_path'] do
    action :delete
  end

  user new_resource.user do
    action :remove
  end

  group new_resource.group do
    action :remove
  end

  package 'znc' do
    action :remove
  end
end
