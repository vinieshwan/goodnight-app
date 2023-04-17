# frozen_string_literal: true

module ProfileServices
    # Service to retrieve user's bedtime logs
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
            @sleep_log ||= Bedtime.where(user_id: @user_id).order(created_at: :desc)
        end

        def user
            @user ||= User.find(@user_id)
        end
    end
end