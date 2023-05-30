class Api < Sinatra::Application
  enable :sessions, :logging

  get "/" do
    session[:hello] = "world"
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

  namespace "/users" do
    get "/" do
      json users: [1, 2, 3]
    end
  end
end
