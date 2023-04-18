# frozen_string_literal: true

# Serializer for follow and unfollow user
class FollowSerializer < ApplicationSerializer
  def initialize(response)
    @response = response
  end

  def serializable_hash
    return response({ errors: @response.errors }) if @response.try(:errors).present?

    response(@response)
  end

  private

  def response(attributes)
    {
      data: {
        type: 'user_following',
        attributes:
      }
    }.as_json
  end
end
