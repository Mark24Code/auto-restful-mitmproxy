module LocalMapProxy
  class Base
    def initialize
      @routes = []
      @output = nil
    end

    attr_reader :routes, :output

    def config(config)
      @output = config[:output] || './mock_api.json'
    end

    def export
      require 'json'
      puts @output
      File.open(@output,"w") do |f|
        content = {
          routes: @routes
        }
        puts content
        f.write(content.to_json)
      end
    end

    def get(path, &handler)
      route("GET", path, &handler)
    end

    def post(path, &handler)
      route("POST", path, &handler)
    end

    def put(path, &handler)
      route("PUT", path, &handler)
    end

    def patch(path, &handler)
      route("PATCH", path, &handler)
    end

    def delete(path, &handler)
      route("DELETE", path, &handler)
    end

    def head(path, &handler)
      route("HEAD", path, &handler)
    end

    def options(path, &handler)
      route("OPTIONS", path, &handler)
    end

    private

    def route(verb, path, &handler)
      @routes.push({
        method: verb,
        path: path,
        response: handler.call
      })
    end

    def params
      @request.params
    end
  end

  BaseApp = Base.new

  module Delegator
    def self.delegate(baseApp,*methods)
      Array(methods).each do |method_name|
        define_method(method_name) do |*args, &block|
            baseApp.send(method_name, *args, &block)
        end

        private method_name
      end
    end

    delegate BaseApp, :config, :export, :get,:post, :patch, :put, :delete, :head, :options
  end
end


# To avoid affecting Object inheritance, bind to the main Object
extend LocalMapProxy::Delegator