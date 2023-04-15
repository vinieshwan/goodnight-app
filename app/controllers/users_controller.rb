# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
    def bedtimes
        response = UserServices::Bedtimes.new(user_id: current_user.id).perform

        render Utils::Response.new(response, { status: :ok }).to_h
    end

    def follow
        response = UserServices::FollowUser.new(follower: current_user.id, followee: params[:id]).perform

        render Utils::Response.new(response, { status: :no_content }).to_h
    end

    def unfollow
        response = UserServices::UnfollowUser.new(follower: current_user.id, followee: params[:id]).perform

        render Utils::Response.new(response, { status: :no_content }).to_h
    end
end