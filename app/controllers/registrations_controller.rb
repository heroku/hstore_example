class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  protected
    def after_sign_up_path_for(resource)
      after_register_path(:add_zip)
    end
end