task default: %w{server}

desc "REPL console for development 'rake c' for short"
task :console do
  require "pry"
  require "./server"
  Pry.start
end

task c: :console
