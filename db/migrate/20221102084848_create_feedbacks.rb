class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :message_heading
      t.text :message_details
      t.boolean :is_resolved , default: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
