class User < ApplicationRecord

  has_many :ideas, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  def full_name
    "#{first_name} #{last_name}"
  end
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      format: VALID_EMAIL_REGEX


end
