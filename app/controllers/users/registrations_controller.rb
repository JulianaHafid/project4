class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    case resource
    when :user, User
      new_profile_path
    else
      super
    end
  end
end
