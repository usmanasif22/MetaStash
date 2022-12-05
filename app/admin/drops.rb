ActiveAdmin.register Drop do


  controller do
    def permitted_params
    params.permit!
    end
  end
   

  index do
    selectable_column
    column :id
    column :reward_type 
    column :reward_amount
    column :is_active
    column :longitude
    column :latitude
    column :time_to_active
    column :city
    column :country_name
    actions
end

  member_action :bulk_create do
    redirect_to new_admin_add_bulk_drop
end
  action_item :bulk_create   do
    link_to "Create Bulk Drops" , new_admin_add_bulk_drop_path
  end

form do |f|
  f.inputs 'Register' do
    f.label :country, class: 'l1'
    f.country_select  :country, priority_countries: ["PK"]
    
    @province = CS.states( :pk)
    @provinces= @province.map{|k,v| v}
    f.label :province, class: 'l1'
    f.select :province, @provinces
    @cities = CS.cities(:pb, :pk)
    f.label :city, class: 'l2'
    f.select :city, @cities
    f.input :latitude 
    f.input :longitude 
    f.input :reward_amount
    f.input :is_active, as: :select, collection: [["Yes", true], ["No", false]], required: true
  end
    
    f.actions
  end
end

ActiveAdmin.register Drop , as: "Add Bulk Drops" do
  menu false

  controller do
    def permitted_params
    params.permit!
    end              
  end
  index do
    selectable_column
    column :id
    column :reward_type 
    column :reward_amount
    column :is_active
    column :longitude
    column :latitude
    column :time_to_active
    column :city
    column :country_name
    actions
end


form url:"/admin/add_bulk_drops/import/drops" , method: :post ,html: { multipart: true } do |f|
      panel "Upload Drop Locations as CSV File" do
        render 'admin/import/bulk_form'
      end
  end
end