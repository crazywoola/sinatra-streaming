class Api < Sinatra::Application
  get "/" do
    "Hello world!"
  end

  get "/stream" do
    stream do |out|
      out << "It's gonna be legen -\n"
      sleep 0.5
      out << " (wait for it) \n"
      sleep 1
      out << "- dary!\n"
    end
  end

  namespace "/users" do
    get "/" do
      json users: [1, 2, 3]
    end
  end
end
