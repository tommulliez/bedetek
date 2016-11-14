class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :password
      t.string :email
      t.references :profil, foreign_key: true

      t.timestamps
    end
  end
end
