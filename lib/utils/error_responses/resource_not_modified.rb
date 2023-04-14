# frozen_string_literal: true

module Utils
    module ErrorResponses
        # Error response if a resource is not found
        class ResourceNotModified < Base
            STATUS = :not_modified
        end
    end
end