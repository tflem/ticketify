class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  mount_uploader :attachment, AttachmentUploader
end
