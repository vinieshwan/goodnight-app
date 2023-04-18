# frozen_string_literal: true

# Bedtime controller
class BedtimeController < ApplicationController
  def in
    response = BedtimeServices::Clockin.new(user_id: current_user.id).perform

    render Utils::Response.new(response, { status: :created }, BedtimeSerializer).to_h
  end

  def out
    response = BedtimeServices::Clockout.new(user_id: current_user.id).perform

    render Utils::Response.new(response, { status: :ok }, BedtimeSerializer).to_h
  end
end
