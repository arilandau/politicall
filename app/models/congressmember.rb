class Congressmember < ApplicationRecord
  validates :full_name, presence: true
  validates :party, presence: true
  validates :chamber, presence: true, format: { with: /(House|Senate)/ }
  validates :email, uniqueness: true, allow_nil: true, format: { with: /\A\w+\@[a-z]+\.[a-z]{3}\z/ }
  validates :state, presence: true

  has_many :congresslists
  has_many :lists, through: :congresslists
end
