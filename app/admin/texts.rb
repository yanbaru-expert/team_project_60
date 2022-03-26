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

  form do |f|
    f.semantic_errors
    f.inputs do
      # enum-help を利用
      input :genre, as: :select, collection: Text.genres_i18n.invert
      input :title
      input :content
    end
    f.actions
  end

  # enum-help を利用
  filter :genre, as: :select, collection: Text.genres_i18n.invert.transform_values { |v| Text.genres[v] }
  filter :title
  filter :content
  filter :created_at
  filter :updated_at
end
