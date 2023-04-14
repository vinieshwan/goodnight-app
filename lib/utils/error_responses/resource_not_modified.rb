# frozen_string_literal: true

module Utils
    module ErrorResponses
        # Error response if a resource is not found
        class ResourceNotModified < Base
            CODE = :resource_not_modified
            HTTP_CODE = 304
        end
    end
end