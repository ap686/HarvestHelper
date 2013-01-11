module UsersHelper
  def get_full_name
    first = current_user.first_name
    last = current_user.last_name
    first + " " + last
  end
end
