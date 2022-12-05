class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.references :ngo_id_1, foreign_key: { to_table: 'ngos' }
      t.references :ngo_id_2, foreign_key: { to_table: 'ngos' }
      t.references :ngo_id_3, foreign_key: { to_table: 'ngos' }
      t.references :ngo_id_4, foreign_key: { to_table: 'ngos' }
      t.references :user, null:true, foreign_key: true
      t.integer :ngo_1_votes,  default: 0
      t.integer :ngo_2_votes,  default: 0
      t.integer :ngo_3_votes,  default: 0
      t.integer :ngo_4_votes,  default: 0
      t.boolean :is_active , :default=>true
      t.timestamps
    end
  end
end
