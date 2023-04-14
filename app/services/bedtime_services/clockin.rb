# frozen_string_literal: true

module BedtimeServices
    # Service to handle user bedtime clockin
    class Clockin < ApplicationService
        def initialize(params)
            @user_id = params[:user_id]
        end

        def perform
            Bedtime.create(user_id: user.id, clock_in: now, created_at: now)

            bedtimes
            
        rescue ActiveRecord::RecordNotFound
            Utils::ErrorResponses::ResourceNotFound.create(
                detail: "User does not exist"
            )
        end

        private

        def bedtimes
            @bedtimes ||= Bedtime.where(user_id: @user_id).order(created_at: :desc)
        end

        def now
            @now ||= DateTime.now
        end

        def user
            @user ||= User.find(@user_id)
        end
    end
end