class Link < ApplicationRecord
  belongs_to :user
  acts_as_votable
  validates :title, presence: true
  validates :url, presence: true
end
