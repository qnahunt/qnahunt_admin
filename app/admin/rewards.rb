ActiveAdmin.register Rewards do
  permit_params :id, :task, :action, :points, :is_active


  form do |f|
    f.inputs "Add Rewards" do
      f.input :task, :as=>:select, :collection=>CommonConfig.where(:name=>"rewards_task").last.value.split(',').map {
                       |value| value}
      f.input :action, :as=>:select, :collection=>CommonConfig.where(:name=>"rewards_action").last.value.split(',')
                                                               .map {
                                  |value| value}
      f.input :points
      f.input :is_active, :as=>:select, :collection=>[[true, 1],[false,0]]

    end
    f.actions
  end


end
