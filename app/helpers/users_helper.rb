module UsersHelper
  def get_full_name
    first = current_user.first_name
    last = current_user.last_name
    first + " " + last rescue nil
  end
  
  def get_first_name
    current_user.first_name rescue nil
  end
  
  def get_last_name
    current_user.last_name rescue nil
  end
end
