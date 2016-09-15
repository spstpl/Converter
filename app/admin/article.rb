ActiveAdmin.register Article do

  permit_params :title, :body

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :created_at
    actions
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs "Article Details" do
      f.input :title, value: f.object.title
      f.input :body, as: :angular
    end
    f.actions
  end

end
