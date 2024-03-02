ActiveAdmin.register Idea do
  # Specify parameters which should be permitted for assignment
  permit_params :name, :description, :picture

  # or consider:
  #
  # permit_params do
  #   permitted = [:name, :description, :picture]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :name
  filter :description
  filter :picture
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visiblity in the index action
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :picture
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visiblity in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :name
      row :description
      row :picture
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :name
      f.input :description
      f.input :picture
    end
    f.actions
  end
end
