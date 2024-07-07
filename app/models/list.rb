class List < ApplicationRecord
  has_one_attached :image
  has_many :bookmarks
  has_many :reviews
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: true
end
