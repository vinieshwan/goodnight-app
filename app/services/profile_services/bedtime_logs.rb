# frozen_string_literal: true

module ProfileServices
  # Service to retrieve user's bedtime logs
  class BedtimeLogs < ApplicationService
    def initialize(params)
      @user_id = params[:user_id]
    end

    def perform
      user_logs
    rescue ActiveRecord::RecordNotFound
      Utils::ErrorResponses::ResourceNotFound.create(
        detail: 'User does not exist'
      )
    end

    private

    # rubocop:todo Layout/LineLength
    def user_logs
      @user_logs ||= User.joins(:bedtimes).where(id: @user_id)
                         .select('users.id, users.name, bedtimes.clock_in, bedtimes.clock_out, bedtimes.duration, bedtimes.created_at')
                         .order('bedtimes.created_at': :desc)
    end
    # rubocop:enable Layout/LineLength
  end
end
