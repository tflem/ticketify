class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
