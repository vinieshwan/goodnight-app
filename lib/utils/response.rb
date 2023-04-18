# frozen_string_literal: true

module Utils
  # Handles response format
  class Response
    def initialize(response, opts, serializer = nil)
      @response = response
      @opts = opts
      @serializer = serializer
    end

    def to_h
      if @response.is_a? ErrorResponses::Error
        return {
          json: @serializer.new(@response).serializable_hash,
          status: @response.status
        }
      end

      {
        json: @serializer.new(@response).serializable_hash,
        status: @opts[:status]
      }
    end
  end
end
