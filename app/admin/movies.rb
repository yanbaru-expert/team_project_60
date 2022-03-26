ActiveAdmin.register Movie do
  permit_params :genre, :title, :url
  
  index do
    selectable_column
    id_column
    column :genre
    column :title
    column :url
    column :created_at
    actions
  end

  filter :genre
  filter :encrypted_password
  filter :url
  filter :created_at

  form do |f|
    f.inputs do
      f.input :genre
      f.input :title
      f.input :url
    end
    f.actions
  end
end
