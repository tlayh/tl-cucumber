#
# Cookbook Name: tl_cucumber
#

execute "install ruby" do
	command "apt-get install libxslt1-dev libxml2-dev build-essential g++ ruby1.9.1-dev postgresql libpq-dev"
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

execute "install qt4-make" do
	command "aptitude install qt4-qmake"
end

execute "install libwebkit" do
	command "apt-get install libqt4-dev libqtwebkit-dev"
end

execute "install xvfb" do
	command "apt-get install xvfb"
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