package 'sudo' do
  not_if 'which sudo'
  action :install
end

template '/etc/sudoers' do
  mode '440'
  owner 'root'
  group 'root'
end
