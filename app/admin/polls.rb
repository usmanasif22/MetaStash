ActiveAdmin.register Poll do
  actions :all, :except => [:new]

  controller do
    def permitted_params
    params.permit!
    end
  end

  index do
    selectable_column
    column :id
    column  "Created By", :user_name 
    column  "Ngo 1", :ngo_id_1.name 
    column :ngo_1_votes
    column "Ngo 2",:ngo_id_2.name
    column :ngo_2_votes
    column "Ngo 3",:ngo_id_3.name
    column :ngo_3_votes
    column "Ngo 4",:ngo_id_4.name
    column :ngo_4_votes
    column :is_active
    column :created_at  
    column :updated_at
    actions
end

  
end
