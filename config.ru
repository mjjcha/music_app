# Require config/environment.rb

require ::File.expand_path('../config/environment', __FILE__)
require ::File.expand_path('../config/database', __FILE__)

set :app_file, __FILE__
run Sinatra::Application
