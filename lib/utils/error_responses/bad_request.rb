# frozen_string_literal: true

module Utils
    module ErrorResponses
        # Error response if bad request
        class BadRequest < Base
            STATUS = :bad_request
        end
    end
end