# frozen_string_literal: true

module UserServices
    # Service to retrieve user's friends' bedtime logs
    class BedtimeLogs < ApplicationService
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
            @sleep_log ||= Bedtime.joins(:follows, :user).where("follows.follower_id": @user_id, "follows.is_following": true).where('bedtimes.clock_in >= ?', 14.day.ago.to_datetime).where.not('bedtimes.duration': nil).select('users.id, users.name, bedtimes.clock_in, bedtimes.clock_out, bedtimes.duration, bedtimes.created_at').order('bedtimes.user_id': :desc, 'bedtimes.duration': :desc)
        end

        def user
            @user ||= User.find(@user_id)
        end
    end
end