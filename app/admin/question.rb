ActiveAdmin.register Question do
permit_params :title, :description, :sub_category_id, :is_open, :user_id, :id,
              answers_attributes: [ :id, :answer, :is_answered, :_destroy ]

form do |f|
  f.inputs "Add a Question" do
    f.input :user_id, :as=>:select, :collection=>User.all.map { |r| [r.email, r.id]}
    f.input :sub_category_id, :as=>:select, :collection=>SubCategory.all.map { |r| [r.name, r.id]}
    f.input :title
    f.input :description
    f.input :is_open
    f.inputs do
      f.has_many :answers, heading: 'Add Answers', allow_destroy: true, new_record: true do |a|
        a.input :answer
      end
    end
    f.inputs do
      f.has_many :question_tags, heading: 'Add Tags', allow_destroy: true, new_record: true do |a|
        a.input :tag
      end
    end
    end
  f.actions
end

controller do
  def permitted_params
    params.permit!
  end
  def update
    super do |format|
    end
  end
end

end
