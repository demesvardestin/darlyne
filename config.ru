# This commands assumes Bundler is installed. Type `which bundler` in your
# terminal to verify. Run `gem install bundler` if it's not installed.
require 'bundler'

# Shorthand for a bunch of ` require 'some_gem' ` commands. All gems
# are now 'preloaded' and ready to be used.
Bundler.require

# File.dirname(FILE) finds the name of the parent directory of the current file
# The below join method converts to something like 'pd/lib/darlyne', where
# pd is the 'parent directory'
require File.join(File.dirname(__FILE__), 'lib', 'darlyne')
require File.join(File.dirname(__FILE__), 'lib', 'application_controller')


DarlyneFramework = Darlyne.new

# Load the routes
require File.join(File.dirname(__FILE__), 'config', 'routes')

# Load helpers
require File.join(File.dirname(__FILE__), 'app', 'helpers/application_helper')

# Load the public folder with all static files for later availability
use Rack::Static, :urls => ["/css", "/images", "/js"], :root => "public"

# Rack starts the application
run ApplicationController.new