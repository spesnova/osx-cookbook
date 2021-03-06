#
# Cookbook Name:: mac
# Recipe:: bettertouchtool
#
# Copyright (C) 2013 Seigo Uchida
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

remote_file "#{Chef::Config[:file_cache_path]}/BetterTouchTool.zip" do
  source node["mac"]["bettertouchtool"]["download_uri"]
  action :create_if_missing
end

execute "unzip BetterTouchTool to /Applications" do
  command "unzip -o #{Chef::Config[:file_cache_path]}/BetterTouchTool.zip -x __MACOSX*"
  cwd "/Applications"
  not_if { File.directory?("/Applications/BetterTouchTool.app") }
  group "wheel"
end
