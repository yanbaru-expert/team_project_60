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

  form do |f|
    f.semantic_errors
    f.inputs do
      # enum-help を利用
      input :genre, as: :select, collection: Movie.genres_i18n.invert
      input :title
      input :url
    end
    f.actions
  end

  # enum-help を利用
  filter :genre, as: :select, collection: Movie.genres_i18n.invert.transform_values { |v| Movie.genres[v] }
  filter :title
  filter :url
  filter :created_at
  filter :updated_at
end
