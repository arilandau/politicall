class Congressmember < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :party, presence: true, format: { with: /\A[DIR]\z/, message: "Must be 'D', 'R', or 'I'" }
  validates :chamber, presence: true, format: { with: /(House|Senate)/ }
  validates :email, uniqueness: true, format: { with: /\A((\w+)|(\.))+\@[a-z]+\.[a-z]{3}\z/ }
  validates :url, uniqueness: true, presence: true
  validates :next_election, presence: true, length: { is: 4 }, numericality: { greater_than: 2016 }
  validates :phone_number, uniqueness: true, presence: true, format: { with: /\A[0-9]{3}-[0-9]{3}-[0-9]{4}\z/ }
  validates :state, presence: true

  has_many :congresslists
  has_many :lists, through: :congresslists
end
