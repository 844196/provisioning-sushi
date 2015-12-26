service 'iptables' do
  action :nothing
end

template '/etc/iptables/iptables.rules' do
  mode '600'
  notifies :enable, "service[iptables]"
end
