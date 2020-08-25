class ChangeDescriptionColumnNameToBodyInTickets < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :description, :body
  end
end
