# frozen_string_literal: true

module UserServices
  # Service to follow a certain user
  class FollowUser < ApplicationService
    class ResourceNotModifiedError < StandardError; end

    def initialize(params)
      @follower = params[:follower]
      @followee = params[:followee]
    end

    def perform
      raise ResourceNotModifiedError if @follower == @followee.to_i

      followed = Follow.create(follower_id: @follower, followee_id: user.id, is_following: true)

      raise ResourceNotModifiedError if followed.id.nil?
    rescue ResourceNotModifiedError
      Utils::ErrorResponses::ResourceNotModified.create
    rescue ActiveRecord::RecordNotFound
      Utils::ErrorResponses::ResourceNotFound.create(
        detail: 'User does not exist'
      )
    end

    private

    def user
      @user ||= User.find(@followee)
    end
  end
end
