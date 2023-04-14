# frozen_string_literal: true

module Utils
    module ErrorResponses
        # Defines logic for base error responses
        class Base    
            def self.create(detail: nil)
                error = ErrorResponses::Error.new
        
                error_payload = {
                    detail: detail,
                    status: self::STATUS
                }
                
                error.add(error_payload)

                error
            end
        end
    end
end