ActiveAdmin.register Question do
permit_params :title, :description, :sub_category_id, :is_open, :user_id

form do |f|
  f.inputs "Add a Question" do
    f.input :user_id, :as=>:select, :collection=>User.all.map { |r| [r.email, r.id]}
    f.input :sub_category_id, :as=>:select, :collection=>SubCategory.all.map { |r| [r.name, r.id]}
    f.input :title
    f.input :description
    f.input :is_open
  end
  f.actions
end

end
