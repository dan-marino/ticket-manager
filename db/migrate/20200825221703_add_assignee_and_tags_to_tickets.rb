class AddAssigneeAndTagsToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :assignee_id, :integer
    add_column :tickets, :tags_id, :integer
  end
end
