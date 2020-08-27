class Ticket < ApplicationRecord
  validates :title, presence: :true
  validates :body, presence: :true
  validates :status, inclusion: %w(new blocked in_progress fixed)
  belongs_to :project
  has_many :ticket_tag
  has_many :tags, through: :ticket_tag
end
