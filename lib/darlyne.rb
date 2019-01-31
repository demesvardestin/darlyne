require File.join(File.dirname(__FILE__), 'router.rb')
# require_relative 'router.rb' ## Simpler alternative

class Darlyne
    attr_reader :router
    ## attr_reader :router creates the below method in the background, making
    ## the @router instance variable available outside of this scope
    # def router
    #     @router
    # end
    
    def initialize
        @router = Router.new
    end
end