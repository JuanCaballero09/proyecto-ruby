class AddDefaultsToUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :activo, from: nil, to: true
    change_column_default :users, :fecha_registro, from: nil, to: -> { 'CURRENT_DATE' }
    change_column_default :users, :rol, from: nil, to: 0
  end
end
