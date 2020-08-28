class RemoveTagsIdFromTickets < ActiveRecord::Migration[6.0]
  def change
    remove_column :tickets, :tags_id
  end
end
