# frozen_string_literal: true

# Serializer for bedtime logs
class BedtimeSerializer < ApplicationSerializer
    def initialize(response)
        @response = response
    end

    def serializable_hash
        user = []

        return response({ errors: @response.errors }) if @response.try(:errors).present?

        @response.each do |data|
            matched_user_index = user.find_index { |element| element[:id] == data.id }
            if matched_user_index && matched_user_index != -1
                user[matched_user_index][:logs].push({ clock_in: data.clock_in, clock_out: data.clock_out, duration: data.duration, created_at: data.created_at })
            else
                user.push({ id: data.id, name: data.name, logs: [{ clock_in: data.clock_in, clock_out: data.clock_out, duration: data.duration, created_at: data.created_at }] })
            end
        end

        response({ users: user })
    end

    private

    def response(attributes)
        {
            data: {
                type: 'users_bedtime_logs',
                attributes: attributes
            }
        }.as_json
    end
end