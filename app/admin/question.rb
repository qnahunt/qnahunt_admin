ActiveAdmin.register Question do
permit_params :title, :description, :category_id, :is_open

end
