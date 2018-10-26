class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.references :person, foreign_key: true
      t.string :key

      t.timestamps
    end
  end
end
