package 'git' do
  not_if 'which git'
  action :install
end
