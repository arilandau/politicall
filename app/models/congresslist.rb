class Congresslist < ApplicationRecord
  belongs_to :list
  belongs_to :congressmember
end
