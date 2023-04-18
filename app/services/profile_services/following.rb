# frozen_string_literal: true

module ProfileServices
    # Service to retrieve user's list of followed users
    class Following < ApplicationService
      def initialize(params)
        @user_id = params[:user_id]
      end
  
      def perform
        following
      rescue ActiveRecord::RecordNotFound
        Utils::ErrorResponses::ResourceNotFound.create(
          detail: 'User does not exist'
        )
      end
  
      private
  
      # rubocop:todo Layout/LineLength
      def following
        @following ||= Follow.joins(:followee).where(follower_id: @user_id, is_following: true)
                           .select('users.id, users.name')
                           .order('follows.created_at': :desc)
      end
      # rubocop:enable Layout/LineLength
    end
  end
  