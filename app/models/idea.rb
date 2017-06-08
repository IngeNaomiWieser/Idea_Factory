class Idea < ApplicationRecord

  belongs_to :user, optional: true

  has_many :likes, dependent: :destroy

  has_many :users, through: :likes

  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  def like_for(user)
    likes.find_by_user_id(user)
  end 

end
