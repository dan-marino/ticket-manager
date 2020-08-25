class ChangeNameColumnToTitleInProjectsAndTickets < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :name, :title
    rename_column :tickets, :name, :title
  end
end
