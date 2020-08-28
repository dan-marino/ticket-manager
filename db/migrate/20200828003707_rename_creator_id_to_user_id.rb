class RenameCreatorIdToUserId < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :creator_id, :user_id
  end
end
