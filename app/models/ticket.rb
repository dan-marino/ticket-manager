class Ticket < ApplicationRecord
  STATUSES = %w(new blocked in_progress fixed)
  validates :title, presence: :true
  validates :body, presence: :true
  validates :status, inclusion: %w(new blocked in_progress fixed)
  belongs_to :project

  has_many :ticket_tag
  has_many :tags, through: :ticket_tag

  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
end
