class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :date
      t.text :user_comment
      t.text :restaurant_comment
      t.boolean :viewed_by_place
      t.boolean :viewed_by_user
      t.string :status
      t.integer :number_of_people

      t.timestamps null: false
    end
  end
end
