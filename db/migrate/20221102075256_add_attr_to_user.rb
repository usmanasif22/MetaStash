class AddAttrToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string, default: "unpaid"
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :payment_status, :boolean, default: false
    add_column :users, :payment_date, :datetime
    add_column :users, :vote_casted, :boolean, default: false
    add_column :users, :total_collection, :float, default: 0.0
  end
end
