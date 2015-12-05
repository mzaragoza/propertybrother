class Managers::ManagersController < ManagerController
  before_filter :check_password_submitted, :only => :update
  expose(:managers){ Manager.where(deleted_by_id: nil).order("id DESC") }
  expose(:manager, attributes: :manager_params)

  def create
    if manager.save
      flash[:notice] = t(:manager_was_successfully_created)
      redirect_to(managers_managers_path)
    else
      render :new
    end
  end

  def update
    if manager.save
      flash[:notice] = t(:manager_was_successfully_updated)
      redirect_to(managers_managers_path)
    else
      render :edit
    end
  end

  def destroy
    manager.deleted_by_id = current_manager.id
    manager.deleted_by_type = current_manager.class.name
    manager.deleted_at = DateTime.now
    manager.save
    flash[:notice] = t(:manager_was_successfully_deleted)
    redirect_to(managers_managers_path)
  end

  private

  def check_password_submitted
    if params[:manager][:password].blank?
      params[:manager].delete("password")
      params[:manager].delete("password_confirmation")
      manager.updating_password = false
    else
      manager.updating_password = true
    end
  end

  def manager_params
    params.require(:manager).permit(
      :email,
      :password,
      :first_name,
      :last_name,
      :active,
      :username,
      :phone,
      :extension,
      :address,
      :city,
      :state,
      :zip,
    )
  end
end


