class Novice < User
    has_many :topics, as: :topic_creator   
    
end
