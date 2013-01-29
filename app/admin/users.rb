ActiveAdmin.register User do
  index do 
    column :first_name 
    column :last_name
    column :email
  end
end
