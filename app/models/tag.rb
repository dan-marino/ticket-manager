class Tag < ApplicationRecord
  before_save { self.title = title.capitalize }
  validates :title, presence: true, uniqueness: {:case_sensitive => false}
  has_many :ticket_tag
  has_many :tickets, through: :ticket_tag
end
