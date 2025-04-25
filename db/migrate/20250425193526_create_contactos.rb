class CreateContactos < ActiveRecord::Migration[8.0]
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.string :correo
      t.integer :telefono
      t.string :direccion

      t.timestamps
    end
  end
end
