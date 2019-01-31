class ApplicationController
    
    ## This controller acts as the rack object, responding to :call, and returning
    ## an array response consisting of an HTTP response code, headers in a hash,
    ## and a body in array form (must respond to :each, per rack specs).
    def call(env)
        route = DarlyneFramework.router.route_for(env)
        if route
            response = route.execute(env)
            return response.rack_response
        else
            return [404, {}, []]
        end
    end
    
end