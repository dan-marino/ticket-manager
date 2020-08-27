class Project < ApplicationRecord
  validates :title, presence: :true
  validates :description, presence: :true
  has_many :tickets

  def total_open_tickets
    self.tickets.select { |ticket|  ticket.status != 'fixed'}.count
  end

  def total_tickets
    self.tickets.count
  end
end
