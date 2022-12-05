ActiveAdmin.register User do
  controller do
    def permitted_params
    params.permit!
    end
    end
    
    index do
      selectable_column
      column :id
      column :name 
      column :email
      column :city
      column :role
      column :payment_status
      column :payment_date
      column :total_collection
      actions
  end


  form do |f|
    f.inputs 'Register' do
      f.input :name, :as => :string
      f.input :email, :as => :string
      f.input :password, :as => :password
      f.input :password_confirmation, :as => :password
      f.input :city, :as => :string
      f.input :country, :as => :string
      f.input :role, as: :select, collection: [["Paid", "paid"], ["Unpaid", "unpaid"], ["Admin", "admin"]]
      f.input :payment_status, as: :select, collection: [["Yes", "true"], ["No", "false"]]
    end
    f.actions
  end
  
  scope:all
    scope:paid
    scope:unpaid
    scope:admin

end
