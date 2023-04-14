# frozen_string_literal: true

module Utils
    module ErrorResponses
        # Error response if a resource is not found
        class ResourceNotFound < Base
            STATUS = :not_found
        end
    end
end