class Custom < BaseController
    def index
        Response.new.tap do |response|
            # Serve the index.html.erb file from the views folder as body
            response.body = File.open(File.join(File.dirname(__FILE__),'..', 'views/index.html.erb'), File::RDONLY)
            response.status_code = 200
        end
    end
end