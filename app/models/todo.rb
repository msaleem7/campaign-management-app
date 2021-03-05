class Todo < ApplicationRecord
    
    validates :description, presence: true, length: { minimum: 3 }, format: {with: /[a-zA-Z]/}
    
    belongs_to :campaign
end
