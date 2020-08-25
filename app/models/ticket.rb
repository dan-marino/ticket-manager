class Ticket < ActiveRecord::Base
  validates :title, presence: :true
  validates :body, presence: :true
  validates :status, inclusion: %w(new blocked in_progress fixed)
  belongs_to :project
end
