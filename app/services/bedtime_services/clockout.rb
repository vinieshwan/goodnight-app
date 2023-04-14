# frozen_string_literal: true

module BedtimeServices
    # Service to handle user bedtime clockout
    class Clockout < ApplicationService
        class ResourceNotModifiedError < StandardError; end
    
        def initialize(params)
            @user_id = params[:user_id]
        end

        def perform
            raise ResourceNotModifiedError if (time_diff/60/60) >= 24 || bedtime.first.clock_out.present?

            bedtime.update(clock_out: now, duration: time_diff)
        rescue ResourceNotModifiedError
            Utils::ErrorResponses::ResourceNotModified.create    
        rescue ActiveRecord::RecordNotFound
            Utils::ErrorResponses::ResourceNotFound.create(
                detail: "Resource does not exist"
            )
        end

        private

        def bedtime
            Bedtime.where(user_id: @user_id).order(clock_in: :desc).limit(1)
        end

        def time_diff
            now.to_i - bedtime.first.clock_in.to_i
        end

        def now
            @now ||= DateTime.now
        end

        def user
            @user ||= User.find(@user_id)
        end
    end
end