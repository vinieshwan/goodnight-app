# frozen_string_literal: true

# Bedtime controller
class BedtimeController < ApplicationController
    def in
        response = BedtimeServices::Clockin.new(user_id: current_user.id).perform

        render Utils::Response.new(response, { http_code: 201 }).to_h
    end

    def out
        response = BedtimeServices::Clockout.new(user_id: current_user.id).perform

        render Utils::Response.new(response, { http_code: 200 }).to_h
    end
end