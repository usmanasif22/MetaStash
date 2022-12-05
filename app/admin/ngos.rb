ActiveAdmin.register Ngo do

  controller do
    def permitted_params
    params.permit!
    end
    end

    index do
      selectable_column
      column :id
      column :name
      column :created_at
      actions
  end
end
