# frozen_string_literal: true

module UserServices
    # Service to retrieve user's friends' bedtime logs
    class Bedtimes < ApplicationService
        def initialize(params)
            @user_id = params[:user_id]
        end

        def perform
            sleep_log

        rescue ActiveRecord::RecordNotFound
            Utils::ErrorResponses::ResourceNotFound.create(
                detail: 'User does not exist'
            )
        end

        private

        def sleep_log
            @sleep_log ||= Bedtime.joins(:follows).where("follows.follower_id": @user_id, "follows.is_following": true).where('bedtimes.clock_in >= ?', 14.day.ago.to_datetime).where.not(duration: nil).order(user_id: :desc, duration: :desc)
        end

        def user
            @user ||= User.find(@user_id)
        end
    end
end