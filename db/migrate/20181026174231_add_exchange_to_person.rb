class AddExchangeToPerson < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :exchange, foreign_key: true
  end
end
