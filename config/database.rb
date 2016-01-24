configure do

  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  set :database, {
    adapter: "postgresql",
    host: "ec2-54-83-20-177.compute-1.amazonaws.com",
    database: "d9483dc6r7lane",
    user: "hzepgsltzgjbfy",
    password: "I1pSPZrChRsTDgqKQosIge3idE",
    port: "5432"
  }

  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end

end
