# frozen_string_literal: true

module BedtimeServices
    # Service to handle user bedtime clockin
    class Clockin < ApplicationService
        def initialize(params)
            @user_id = params[:user_id]
        end

        def perform
            Bedtime.create(user_id: @user_id, clock_in: now, created_at: now)

            user_logs
            
        rescue ActiveRecord::RecordNotFound
            Utils::ErrorResponses::ResourceNotFound.create(
                detail: 'User does not exist'
            )
        end

        private

        def now
            @now ||= DateTime.now
        end

        def user_logs
            @user_logs ||= User.joins(:bedtimes).where(id: @user_id).select('users.id, users.name, bedtimes.clock_in, bedtimes.clock_out, bedtimes.duration, bedtimes.created_at').order('bedtimes.created_at': :desc)
        end
    end
end