# frozen_string_literal: true

# Bedtime model
class Bedtime < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :follows, primary_key: :followee_id, foreign_key: :user_id, class_name: 'Follow'
end
