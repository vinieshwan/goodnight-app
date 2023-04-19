# frozen_string_literal: true

module BedtimeServices
  # Service to handle user bedtime clockout
  class Clockout < ApplicationService
    class BadRequestError < StandardError; end

    def initialize(params)
      @user_id = params[:user_id]
    end

    # rubocop:todo Metrics/MethodLength
    def perform
      raise BadRequestError if bedtime.first.try(:clock_in).nil? || (time_diff / 60 / 60) >= 24 || bedtime.first.clock_out.present?

      bedtime.update(clock_out: now, duration: time_diff)

      user_log
    rescue BadRequestError
      Utils::ErrorResponses::BadRequest.create(
        detail: 'You need to login first or your last login is greater than 24 hours ago.'
      )
    rescue ActiveRecord::RecordNotFound
      Utils::ErrorResponses::ResourceNotFound.create(
        detail: 'Resource does not exist'
      )
    end
    # rubocop:enable Metrics/MethodLength

    private

    def bedtime
      Bedtime.where(user_id: @user_id).order(clock_in: :desc).limit(1)
    end

    # rubocop:todo Layout/LineLength
    def user_log
      @user_log ||= User.joins(:bedtimes).where('bedtimes.id': bedtime.first.id)
                        .select('users.id, users.name, bedtimes.clock_in, bedtimes.clock_out, bedtimes.duration, bedtimes.created_at')
    end
    # rubocop:enable Layout/LineLength

    def time_diff
      now.to_i - bedtime.first.try(:clock_in).to_i
    end

    def now
      @now ||= DateTime.now
    end

    def user
      @user ||= User.find(@user_id)
    end
  end
end
