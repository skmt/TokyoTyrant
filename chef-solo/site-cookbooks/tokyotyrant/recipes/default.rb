#
# Cookbook Name:: tokyotyrant
# Recipe:: default
#
# Copyright 2013, CyberAgent, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Requirements for running TokyoTyrant is the following;
#
# 1.Rc-script
#   /etc/init.d/ttserver
#
# 2.Log Rotation
#   /etc/logrotate.d/ttserver.${PORT}
#
# 3.Data and Log Directory
#   /var/lib/tt.${PORT}
#
# This recipe sets the above but will not make the directory described as 
# No.3 because that rc-script makes it at the first time running
# TokyoTyrant.
#

node['tokyotyrant_ports'].each do |port|

  template "rc-script" do
    path "/etc/init.d/ttserver.#{port}"
    source "rc_ttserver.erb"
    owner "root"
    group "root"
    mode 0755
    variables({
      :port => "#{port}"
      })
  end

  template "logrotation" do
    path "/etc/logrotate.d/ttserver.#{port}"
    source "logrotate_ttserver.erb"
    owner "root"
    group "root"
    mode 0644
    variables({
      :port => "#{port}"
      })
  end

  service "ttserver.#{port}" do
    supports :status => true
    action [ :enable ]
  end

end