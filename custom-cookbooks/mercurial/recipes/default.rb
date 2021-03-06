include_recipe 'yum-repoforge'

case node['platform_family']
when 'rhel'
  package 'mercurial' do
    action [:install, :upgrade]
    options '--enablerepo=rpmforge-extras'
  end
when 'debian'
  package 'mercurial' do
    action :upgrade
  end
when 'windows'
  windows_package "Mercurial" do
    source node['hg']['windows_url']
    action :install
  end
end
