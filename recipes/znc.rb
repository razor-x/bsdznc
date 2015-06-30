#
# Cookbook Name:: bsdznc
# Recipe:: znc
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

bsdznc 'default' do
  action :create
  subscribes :restart, 'certificate_manage[znc]'
end

certificate_manage 'znc' do
  cert_path node['bsdznc']['cert_path']
  cert_file node['bsdznc']['cert_file']
  combined_file true
  owner node['bsdznc']['user']
  group node['bsdznc']['group']
end
