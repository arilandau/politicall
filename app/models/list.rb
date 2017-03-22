class List < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :congresslists
  has_many :congressmembers, through: :congresslists
end
