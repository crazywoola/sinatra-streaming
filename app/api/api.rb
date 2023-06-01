class Api < Sinatra::Application
  enable :sessions, :logging

  before do
    content_type 'application/json'
  end
  
  get "/" do
    "Hello world!"
  end

  get "/stream" do
    str = session[:hello]

    stream do |out|
      out << "It's gonna be legen -\n"
      sleep 0.5
      out << " (wait for it) \n"
      sleep 1
      out << "- dary! #{str}\n"
    end
  end

  namespace "/api/v1" do
    get '/users' do
      users = User.all.map(&:json)
      json users
    end

    get "/users/:id" do |id|
      user = User[id]
      json user.json
    end

    post '/users' do 
      user = User.create(name: params[:name])
      json user.json
    end
  end
end
