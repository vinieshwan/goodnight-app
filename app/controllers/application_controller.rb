# frozen_string_literal: true

class ApplicationController < ActionController::API
    include ActionController::HttpAuthentication::Basic::ControllerMethods

    before_action :authenticate

    attr_reader :current_user

    protected

    def authenticate
        authenticate_with_http_basic do |api_key|
            return not_authorized unless api_key.present?

            user = User.find_by(api_key: api_key)

            return not_authorized unless user.present?
            
            @current_user = user
        end

        return not_authorized if @current_user.nil?
    end

    def not_authorized
        render status: :unauthorized, json: {
          errors: [{ detail: 'You are not authorized to perform this action' }].as_json
        }
    end  
end
