class Comment < ApplicationRecord

  validates :title, presence: true, length: { minimum: 1 }, format: {with: /[a-zA-Z]/}


  belongs_to :commentable, polymorphic: true
  belongs_to :commented, polymorphic: true
end
