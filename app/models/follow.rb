class Follow < ApplicationRecord
    belongs_to :follower, class_name: 'User'
    belongs_to :followee, class_name: 'User'

    has_many :bedtimes, class_name: 'Bedtime'

    validates_uniqueness_of :follower_id, scope: [:followee_id], conditions: -> { where(is_following: true) }
end
