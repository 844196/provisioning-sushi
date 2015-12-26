user node['username'] do
  gid '10'
  password ''
  create_home true
end

directory "/home/#{node['username']}/.ssh" do
  owner node['username']
  mode '700'
end

file "/home/#{node['username']}/.ssh/authorized_keys" do
  content open('https://github.com/844196.keys').to_a.join
  owner node['username']
  mode '600'
end
