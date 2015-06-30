
#
# Cookbook Name:: bsdznc
# Resource:: default
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

=begin
#<
@action create create and start the znc server.
@action start start the znc server.
@action stop stop the znc server.
@action destroy destroy the znc server.
@action nothing do nothing.
@attribute name the name of the znc server.
@attribute user the user to run the ZNC server under.
@attribute group the group to run the ZNC server under.
#>
=end

default_action :create
actions :create, :start, :stop, :destroy

attribute :name, kind_of: String, required: true, name_attribute: true
attribute :user, kind_of: String, default: 'znc'
attribute :group, kind_of: String, default: 'znc'
