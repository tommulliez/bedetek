class AddCoordinatesToProfil < ActiveRecord::Migration[5.0]
  def change
    add_column :profils, :latitude, :float
    add_column :profils, :longitude, :float
  end
end
