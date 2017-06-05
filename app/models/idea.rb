class Idea < ApplicationRecord

  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

end
