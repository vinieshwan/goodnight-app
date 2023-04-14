
# frozen_string_literal: true

module Utils
    module ErrorResponses
        # Defines logic for error handling
        class Error
            attr_accessor :status
  
            def initialize
                @errors = []
            end
  
            def add(detail: '', status: '')
                @errors.push(
                    detail: detail,
                )

                @status = status
            end
        end
    end
end