class Topic < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3 }, format: {with: /[a-zA-Z]/}
    validate :user_allowed

    has_many :comments, as: :commentable
    belongs_to :campaign
    belongs_to :topic_creator, polymorphic: true
    

    def user_allowed
        if campaign.expert.campaigns.joins(:topics).where(topics: {topic_creator_id: topic_creator.id}).any?
            errors.add(:base, "Not Allowed")
        end
    end
    
end

                # error.add("You have already created a topic for campaigns belonging to this Expert")
