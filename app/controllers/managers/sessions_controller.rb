class Managers::SessionsController < Devise::SessionsController
  layout 'managers/login'

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private

  def after_sign_in_path_for(resource)
    managers_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_manager_session_path
  end

end

