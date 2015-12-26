service 'sshd' do
  action :nothing
end

template '/etc/ssh/sshd_config' do
  mode '600'
  notifies :restart, 'service[sshd]'
end
