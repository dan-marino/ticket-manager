class Ticket < ActiveRecord::Base
  validates :status, inclusion: %w(new, blocked, in_progress, fixed)
  belongs_to :project
end
