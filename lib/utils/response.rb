# frozen_string_literal: true

module Utils
    # Handles response format
    class Response
        def initialize(response, opts)
            @response = response
            @opts = opts
        end
    
        def to_h
            if @response.is_a? ErrorResponses::Error
                return {
                    json: @response.as_json,
                    status: @response.http_code
                }
            end
    
            {
                json: @response.as_json,
                status: @opts[:http_code]
            }
        end
    end
end
  