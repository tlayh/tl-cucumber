#
# Cookbook Name: tl-cucumber
#

packages=[
	"libxslt1-dev",
	"libxml2-dev",
	"build-essential",
	"g++",
	"ruby1.9.1-dev",
	"postgresql",
	"libpq-dev",
	"qt4-qmake",
	"libqt4-dev",
	"libqtwebkit-dev",
	"xvfb"
]

case node[:platform]
when "debian","ubuntu"
	packages.each do |pkg|
		package pkg do
			action :upgrade
		end
	end
end

execute "set some pathes 1" do
	command "alias bundle-bootstrap='bundle install --binstubs=.bundle/bin --path=.bundle/gems'"
end

execute "export gem home" do
	command "export GEM_HOME=$HOME/.gems"
end

execute "export bundle" do
	command "export PATH=.bundle/bin:$GEM_HOME/bin:$PATH"
end

execute "install bundler" do
	command "gem install bundle"
end

# copy Gemfile
cookbook_file "/home/vagrant/Gemfile" do
  source "Gemfile"
  mode 0755
  owner "vagrant"
end

# install via bundle
execute "bundle install" do
	command "bundle install"
end