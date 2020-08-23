class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.text :description
      t.text :status
      t.timestamps
    end
  end
end
