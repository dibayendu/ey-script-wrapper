# Add the name of your command here. Only use 
# alpha-numeric characters, as this will be used
# to create filenames.
command_name = ''

# The path to your command. If this is rake task,
# make sure you use bundle exec if appropriate
# and note that the working directory will be
# your app's current directory when this is called.
command_to_run = ''

# Which app is this for?
app_name = ''

# Let's assume this will be done on a util instance...
# Change this as necessary.
if ['util'].include?(node[:instance_role])
  service "monit" do
    supports :reload => true
    action :enable
  end

  template "/usr/local/bin/#{app_name}_#{command_name}_wrapper" do
    owner node[:owner_name]
    group node[:group_name]
    mode 0755
    source "wrapper.sh.erb"
    variables({:command_name => command_name,
               :command_to_run => command_to_run})
  end

  template "/etc/monit.d/#{app_name}_#{command_name}.monitrc" do
    owner 'root'
    group 'root'
    mode 0644
    source 'monitrc.erb'
    variables({:app_name => app_name,
               :command_name => command_name,
               :command_to_run => command_to_run})
    notifies :reload, resources(:service => 'monit')
  end
end
