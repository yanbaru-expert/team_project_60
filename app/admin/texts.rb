ActiveAdmin.register Text do
  
  permit_params :genre, :title, :content
  
  index do
    selectable_column
    id_column
    column :genre
    column :title
    column :content
    column :created_at
    actions
  end

  filter :genre
  filter :encrypted_password
  filter :content
  filter :created_at

  form do |f|
    f.inputs do
      f.input :genre
      f.input :title
      f.input :content
    end
    f.actions
  end


end
