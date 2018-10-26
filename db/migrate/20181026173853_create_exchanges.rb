class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.string :name
      t.date :date
      t.integer :status

      t.timestamps
    end
  end
end
