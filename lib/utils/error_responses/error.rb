
# frozen_string_literal: true

module Utils
    module ErrorResponses
        # Defines logic for error handling
        class Error
            attr_accessor :errors, :status
  
            def initialize
                @errors = []
            end
  
            def add(data)
                @errors.push(
                    detail: data[:detail],
                )

                @status = data[:status]
            end
        end
    end
end