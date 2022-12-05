class CreateDrops < ActiveRecord::Migration[7.0]
  def change
    create_table :drops do |t|
      t.string :reward_type , default: "Dollar"
      t.float :reward_amount , default: 0.0
      t.boolean :is_active , default: false
      t.float :longitude 
      t.float :latitude 
      t.datetime :time_to_active 
      t.string :city
      t.string :country 
      t.string :province
      t.timestamps
    end
  end
end
