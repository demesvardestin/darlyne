class Response
  attr_accessor :status_code, :headers, :body

  def initialize
    @headers = {
        'Content-Type'  => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
    }
  end

  def rack_response
    [status_code, headers, Array(body)]
  end
end