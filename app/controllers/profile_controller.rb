# frozen_string_literal: true

# Profile controller
class ProfileController < ApplicationController
  def bedtime_logs
    response = ProfileServices::BedtimeLogs.new(user_id: current_user.id).perform

    render Utils::Response.new(response, { status: :ok }, BedtimeSerializer).to_h
  end

  def following
    response = ProfileServices::Following.new(user_id: current_user.id).perform

    render Utils::Response.new(response, { status: :ok }, FollowSerializer).to_h
  end
end
