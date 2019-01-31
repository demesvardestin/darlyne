require File.join(File.dirname(__FILE__), 'route')

class Router
    attr_reader :routes
    
    # When this class is initialized, a hash is created, with a default return
    # value of an empty array ([]) instead of nil when a key doesn't exist.
    def initialize
        @routes = Hash.new { |hash, key| hash[key] = [] }
    end
    
    # This is the config method that is called in the routes as
    # `DarlyneFramework.router.config`. It takes a block and calls instance_eval
    # on it, using itself as the only argument
    def config &block
        instance_eval &block
    end
    
    # This is the :get method that is called as a block in the config method. It
    # takes the path, such as '/index', as a string, and a hash of options (at
    # the minimum, a controller/class name, along with an action/method, such
    # as 'custom#index', where custom is the Custom controller). It then goes
    # on to store/concatenate the path and the parsed options.
    def get path, options = {}
        @routes[:get] << [path, parse_to(options[:to])]
    end
    
    # This method retrieves and stores the path information and request method
    # from the `env` hash provided by Rack. Then it tries to figure out the
    # corresponding route with a switch statement. It must be noted that
    # this particular implementation is greatly simplified.
    def route_for env
        path   = env["PATH_INFO"]
        method = env["REQUEST_METHOD"].downcase.to_sym
        route_array = routes[method].detect do |route|
            case route.first
            when String
                path == route.first
            when Regexp
                path =~ route.first
            end
        end
        return Route.new(route_array) if route_array
        return nil #No route matched
    end
    
    private
    
    # This method retrieves the controller class and action/method corresponding
    # to the route called.
    def parse_to to_string
        klass, method = to_string.split("#")
        {:klass => klass.capitalize, :method => method}
    end
end