
task default: %w[init]

desc "init environment"
task :init do
  sh "rake --tasks"
end

desc "run watch"
task :run => [:watch] do
end

desc "run watch"
task :watch do
  exec "ruby ./bin/watch.rb"
end

desc "run builder"
task :builder do
  exec "ruby ./bin/builder.rb"
end

desc "run mitmproxy"
task :mitmproxy do
  file_path = File.expand_path(File.join(File.dirname(__FILE__), './bin/restful-proxy.py'))
  puts file_path
  exec "mitmproxy -s #{file_path}"
end

desc "run mitmproxy web"
task :mitmweb do
  file_path = File.expand_path(File.join(File.dirname(__FILE__), './bin/restful-proxy.py'))
  puts file_path
  exec "mitmweb -s #{file_path}"
end


# alias task
def alias_task(tasks)
  tasks.each do |new_name, old_name|
      task new_name, [*Rake.application[old_name].arg_names] => [old_name]
  end
end

alias_task [
  [:r, :run],
  [:m, :mitmproxy],
  [:mw, :mitmweb],
  [:w, :watch],
]