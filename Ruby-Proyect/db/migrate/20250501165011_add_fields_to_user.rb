class AddFieldsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :telefono, :string
    add_column :users, :rol, :integer
    add_column :users, :activo, :boolean
    add_column :users, :ultimo_acceso, :datetime
    add_column :users, :fecha_registro, :date
  end
end
