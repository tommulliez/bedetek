class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :end_time
      t.datetime :start_time
      t.references :comic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
