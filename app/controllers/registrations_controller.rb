class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  protected
    def after_sign_up_path_for(resource)
      # previous_path_or(resource)
      after_register_path(:add_zip)
    end
end