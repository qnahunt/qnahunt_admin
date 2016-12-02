ActiveAdmin.register Question do
permit_params :title, :description, :sub_category_id, :is_open, :user_id, :id, :tags,
              answers_attributes: [ :id, :answer, :is_answered, :_destroy ]

form do |f|
  f.inputs "Add a Question" do
    f.input :user_id, :as=>:select, :collection=>User.all.map { |r| [r.email, r.id]}
    f.input :sub_category_id, :as=>:select, :collection=>SubCategory.all.map { |r| [r.name, r.id]}
    f.input :title
    f.input :description
    f.input :is_open
    @tags = []
    resource.question_tags && resource.question_tags.each do |qtag|
      tag = Tag.find(qtag.tag_id)
      @tags << tag.name if tag && !tag.blank?
    end
    @tags = @tags.join(',')
    f.input :tag, :as=>:string, :input_html=>{:value=>@tags}
    f.inputs do
      f.has_many :answers, heading: 'Add Answers', allow_destroy: true, new_record: true do |a|
        a.input :answer
      end
    end
    end
  f.actions
end


controller do
  def permitted_params
    params.permit!
  end


  def create
    super do |format|
      if params[:question][:tag].present?
        tags = params[:question][:tags].split(',').collect(&:strip)
        self.tag_management(resource, tags)
      end
      resource.answers.update_all(:user_id=>params[:question][:user_id])
    end
  end
  def update
    super do |format|
      if params[:question][:tag].present?
       tags = params[:question][:tag].split(',').collect(&:strip)
       self.tag_management(resource, tags)
      end
      resource.answers.update_all(:user_id=>params[:question][:user_id])
    end
  end

  def tag_management(resource,tags)
    if tags && tags.count > 0
      tags && tags.each do |tag_name|
        found_tag = Tag.find_or_create_by(:name=>tag_name.strip)
        QuestionTag.find_or_create_by(:question_id=>resource.id, :tag_id=>found_tag.id)
      end
    end
    @old_tags = []
    resource.question_tags && resource.question_tags.each do |qt|
      tag = Tag.find(qt.tag_id)
      @old_tags << tag.name.strip if tag.present?
    end
    to_be_deleted = @old_tags - tags
    if to_be_deleted.count > 0
      to_be_deleted && to_be_deleted.each do |d_tag|
        delete_tag = Tag.find_by_name(d_tag)
        resource.question_tags.where(:tag_id=>delete_tag.id).destroy_all
      end
    end
  end
end

end
