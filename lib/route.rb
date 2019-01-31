require File.join(File.dirname(__FILE__), '../', 'app', 'controllers', 'base_controller')

class Route
    attr_accessor :klass_name, :path, :instance_method
  
    # Make the path, klass_name and instance_method values available outside this
    # scope.
    def initialize route_array
        @path            = route_array.first
        @klass_name      = route_array.last[:klass]
        @instance_method = route_array.last[:method]
        handle_requires
    end
    
    # Constantize klass_name to get the actual controller class
    def klass
        Module.const_get(klass_name)
    end
    
    # Pass the env hash to the controller class and call the action/method
    def execute(env)
        klass.new(env).send(instance_method.to_sym)
    end
    
    def handle_requires
        require File.join(File.dirname(__FILE__), '../', 'app', 'controllers', klass_name.downcase + '.rb')
    end
end