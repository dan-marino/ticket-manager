class AddProjectIdColumnToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :project_id, :integer
  end
end
