require 'open-uri'


# change hostname
file '/etc/hostname' do
  content 'ConoHa'
end



# system update
execute 'update package' do
  command 'pacman -Syu --noconfirm'
end

## install package
package 'sudo'
package 'git'
package 'gvim'



# add user
USER_NAME = 's083027'

user USER_NAME do
  gid '10'
  password ''
  create_home true
end



# ssh
directory "/home/#{USER_NAME}/.ssh" do
  owner USER_NAME
  mode '700'
end

file "/home/#{USER_NAME}/.ssh/authorized_keys" do
  content open('https://github.com/844196.keys').to_a.join
  owner USER_NAME
  mode '600'
end

template 'sshd' do
  path '/etc/ssh/sshd_config'
  source 'templates/sshd_config'
  mode '600'
end

service 'sshd' do
  subscribes :restart, 'template[sshd]'
end



# vimrc
file "/home/#{USER_NAME}/.vimrc" do
  content open('https://raw.githubusercontent.com/844196/dotfiles/master/.vimrc').to_a.join
  owner USER_NAME
  mode '664'
end



# sudo
template 'sudoers' do
  path '/etc/sudoers'
  source 'templates/sudoers'
  mode '440'
  owner 'root'
  group 'root'
end



# iptables
template 'iptables' do
  path '/etc/iptables/iptables.rules'
  source 'templates/iptables'
  mode '600'
end

service 'iptables' do
  action :enable
end
