ActiveAdmin.register User do
  index do
    column :first_name 
    column :last_name
    column :email
    column "Number of Garden Devices" do |user|
      user.garden_devices.count
    end
    column "Garden Device details" do 
      link_to 'Show devices', admin_garden_devices_path
    end
    column "Action" do |user|
      link_to 'Edit', edit_admin_user_path(user)                                    
    end
  end
  
  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end

end
