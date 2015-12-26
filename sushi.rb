require 'open-uri'

execute 'update package' do
  command 'pacman -Syu --noconfirm'
end

include_recipe 'cookbooks/user.rb'
include_recipe 'cookbooks/vim.rb'
include_recipe 'cookbooks/git.rb'
include_recipe 'cookbooks/sshd.rb'
include_recipe 'cookbooks/iptables.rb'
include_recipe 'cookbooks/sudo.rb'
