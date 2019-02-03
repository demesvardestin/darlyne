class Main < BaseController
    
    def index
        serve_response(__method__)
    end
    
    private
    
    # This method will be called from every action matching a route in order
    # to prevent repetition.
    def serve_response(method, body=nil)
        Response.new.tap do |response|
            begin
                response.body = body ? body : File.open(get_file(method.to_s), File::RDONLY)
                response.status_code = 200
            rescue
                response.body = File.open(File.join(File.dirname(__FILE__),'..','..','public/404.html'))
                response.status_code = 404
            end
        end
    end
    
    # This is a method for dynamic file serving
    def get_file(action_name)
        File.join(File.dirname(__FILE__),'..', "views/#{action_name}.html.erb")
    end
    
    def erb(file)
        Erb.new(file).result(binding)
    end
end