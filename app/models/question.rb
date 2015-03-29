class Question < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  has_many :comments
  has_many :votes
  has_many :voters, through: :votes, class_name: "User", source: :user
end