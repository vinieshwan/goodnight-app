
# frozen_string_literal: true

module Utils
    module ErrorResponses
        # Defines logic for error handling
        class Error
            attr_accessor :http_code
  
            def initialize
                @errors = []
                @http_code = 400
            end
  
            def add(attribute: '', code: '', detail: '')
                @errors.push(
                    attribute: attribute,
                    code: code,
                    detail: detail
                )
            end
        end
    end
end