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
                    status: @response.status
                }
            end
    
            {
                json: @response.as_json,
                status: @opts[:status]
            }
        end
    end
end
  