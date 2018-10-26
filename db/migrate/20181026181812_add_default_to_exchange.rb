class AddDefaultToExchange < ActiveRecord::Migration[5.2]
  def change
    change_column_null :exchanges, :status, false
change_column_default :exchanges, :status, from: 0, to: 0
  end
end
