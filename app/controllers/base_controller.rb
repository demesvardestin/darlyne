require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'response')

class BaseController
    # The purpose of this parent controller class is to allow for dynamic
    # route retrieval from multiple controllers. It's an equivalent to the
    # ApplicationController class in Rails apps. Without it, we'd have to add
    # the below initialize method in every controller file, which wouldn't be
    # too pretty.
    attr_reader :env
    
    def initialize env
      @env = env
    end
end