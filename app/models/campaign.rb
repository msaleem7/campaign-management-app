class Campaign < ApplicationRecord
    
    enum estimated_duration: [ :within_1_week, :within_1_month, :within_3_months]


    validates :title, presence: true, length: { minimum: 3 }, format: {with: /[a-zA-Z]/}
    validates :purpose, presence: true, length: { minimum: 3 }, format: {with: /[a-zA-Z]/}
    validates :estimated_duration, inclusion: { in: estimated_durations.keys }

    
    has_many :comments, as: :commentable ,dependent: :destroy
    has_many :todos, dependent: :destroy
    has_many :topics, dependent: :destroy
    belongs_to :expert, class_name: "User", foreign_key: :user_id
end
