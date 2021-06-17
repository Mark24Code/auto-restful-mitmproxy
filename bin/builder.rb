require_relative '../lib/local_proxy'

output = File.join(File.dirname(__FILE__), '../build/mock_api.json')
config(output: output)

apis = Dir['./local_proxy/**/*.api.rb']
apis.each do |f|
  require f
end

export()