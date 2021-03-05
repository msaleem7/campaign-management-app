class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum status: [:qualified, :unqualified, :banned]

  validates :username, presence: true, length: { minimum: 3 }, format: {with: /[a-zA-Z]/}
  validates :status, inclusion: { in: statuses.keys }
  validates :type, presence: true, inclusion: ["Expert", "Novice"]

  
  has_many :comments, as: :commented

  before_validation :set_status

  def is_novice?
    type="Novice"
  end
  
    
  
  def set_status
    self.type=="Expert"? self.status ||= :qualified : self.status ||= :unqualified
  end
end
