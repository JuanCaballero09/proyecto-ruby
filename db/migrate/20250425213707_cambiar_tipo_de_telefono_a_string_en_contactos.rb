class CambiarTipoDeTelefonoAStringEnContactos < ActiveRecord::Migration[8.0]
  def change
    change_column :contactos, :telefono, :string
  end
end
