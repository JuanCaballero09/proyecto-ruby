class CreateCarros < ActiveRecord::Migration[8.0]
  def change
    create_table :carros do |t|
      t.string :nombre
      t.string :placa

      t.timestamps
    end
  end
end
