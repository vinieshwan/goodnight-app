# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
    def follow
        response = UserServices::FollowUser.new(follower: current_user.id, followee: params[:id]).perform

        render Utils::Response.new(response, { http_code: 204 }).to_h
    end

    def unfollow
        response = UserServices::UnfollowUser.new(follower: current_user.id, followee: params[:id]).perform

        render Utils::Response.new(response, { http_code: 204 }).to_h
    end
end