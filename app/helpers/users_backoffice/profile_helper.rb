module UsersBackoffice::ProfileHelper

  def welcome_user_present
    "Seja bem-vindo,"
  end

  def welcome_user_not_present
    "Seja bem-vindo!!!"
  end

  def name_user_present
    "#{current_user.full_name}!"
  end
end
