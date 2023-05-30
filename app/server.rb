REDIS = YAML.load(File.read(File.expand_path('../../config/redis.yml', __FILE__)), symbolize_names: true)
puts REDIS
# if  == 'production'
    Ohm.redis = Redic.new("redis://#{REDIS[:development][:redis][:host]}:6379")
# else
    # Ohm.redis = Redic.new("redis://#{SOME_ENV[:development][:redis][:host]}:6379")
# end

get '/' do
  'Hello world!'
end

get '/stream' do
  stream do |out|
    out << "It's gonna be legen -\n"
    sleep 0.5
    out << " (wait for it) \n"
    sleep 1
    out << "- dary!\n"
  end
end