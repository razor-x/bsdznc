#
# Cookbook Name:: bsdznc
# Attributes:: default
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

default['bsdznc']['znc_version'] = '1.6.0'
default['bsdznc']['config_path'] = '/usr/local/etc/znc'
default['bsdznc']['cert_file'] = '/usr/local/etc/znc/znc.pem'
default['bsdznc']['irc_port'] = 6667
default['bsdznc']['web_port'] = 443
default['bsdznc']['uri_prefix'] = '/'
