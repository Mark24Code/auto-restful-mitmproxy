require "listen"
require "fileutils"

OUTPUT = "./local_proxy"
def auto_run files
	fork do
		builder = File.join(File.dirname(__FILE__), './builder.rb')
		exec "ruby #{builder}"
	end
end

listener = Listen.to(OUTPUT) do |modified, added, removed|
	begin
		if not added.empty?
			auto_run(added)
		end
	
		if not modified.empty?
			auto_run(modified)
		end
	
		if not removed.empty?
			auto_run(removed)
		end
	rescue => exception
		puts exception
	end
end

listener.start
puts '[status]watcher is working...'
sleep