class AddDefaultValueToUserColor < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :color, from: nil, to: '#370617'
  end
end
