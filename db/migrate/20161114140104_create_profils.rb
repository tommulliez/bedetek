class CreateProfils < ActiveRecord::Migration[5.0]
  def change
    create_table :profils do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :avatar
      t.string :city
      t.string :country
      t.string :preferences

      t.timestamps
    end
  end
end
