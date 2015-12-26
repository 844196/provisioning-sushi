package 'vim' do
  not_if 'which vim'
  action :install
end

file "download .vimrc" do
  content open('https://raw.githubusercontent.com/844196/dotfiles/master/.vimrc').to_a.join
  path "/home/#{node['username']}/.vimrc"
  owner node['username']
  mode '664'
end
