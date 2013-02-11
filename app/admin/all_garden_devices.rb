ActiveAdmin.register GardenDevice , :as => "All Garden Devices" do
  index do 
    column :name 
    column :serial_number
    column 'Owner' do |device|
      device.user.get_full_name
    end
  end
  
  form do |f|
    f.inputs "Details" do 
      f.input :name
      f.input :serial_number
      f.input :user, :label => "User Full Name", :as => :select, :label_method => :user_name , :value_method => :id
    end
    f.buttons
  end
end