# frozen_string_literal: true

module UserServices
    # Service to unfollow a certain user
    class UnfollowUser < ApplicationService
        class ResourceNotModifiedError < StandardError; end

        def initialize(params)
            @follower = params[:follower]
            @followee = params[:followee]
        end

        def perform
            unfollowed = Follow.update({ is_following: false }) if following.present?
            raise ResourceNotModifiedError unless unfollowed.present?
        rescue ResourceNotModifiedError
            Utils::ErrorResponses::ResourceNotModified.create
        rescue ActiveRecord::RecordNotFound
            Utils::ErrorResponses::ResourceNotFound.create(
                detail: "User does not exist"
            )
        end

        private

        def following
            @following ||= Follow.find_by(follower_id: @follower, followee_id: user.id, is_following: true)
        end

        def user
            @user ||= User.find(@followee)
        end
    end
end