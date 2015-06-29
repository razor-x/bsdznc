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

  user 'znc' do
    system true
    action :create
  end

  group 'znc' do
    system true
    action :create
  end
end

action :start do
end

action :stop do
end

action :destroy do
  package 'znc' do
    action :remove
  end

  user 'znc' do
    action :remove
  end

  group 'znc' do
    action :remove
  end
end
