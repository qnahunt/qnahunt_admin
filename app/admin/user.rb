ActiveAdmin.register User do
  permit_params :name, :email, :password, :mobile
  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :confirm_password
      f.input :mobile
    end

    f.actions
  end
end