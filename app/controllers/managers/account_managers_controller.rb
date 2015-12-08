class Managers::AccountManagersController < ManagerController
  expose(:account){ Account.find(params[:account_id]) }
  expose(:account_managers){ account.account_managers.order("id DESC") }
  expose(:account_manager, attributes: :account_manager_params)

  def create
    account.account_managers.destroy_all
    puts '*' * 99
    puts params
    puts '*' * 99
    params[:manager_id].each do |manager_id|
      account.account_managers.create(manager_id: manager_id)
    end
      lead = account.account_managers.find_by(manager_id: params[:lead].to_i)
      if lead
        lead.lead = true
        lead.save
      end
    flash[:notice] = t(:account_manager_was_successfully_created)
    redirect_to(edit_managers_account_path(account))
  end

  def update
    if account_manager.save
      flash[:notice] = t(:account_manager_was_successfully_updated)
      redirect_to(edit_managers_account_path(account))
    else
      render :edit
    end
  end

  def destroy
    account_manager.delete
    flash[:notice] = t(:account_manager_was_successfully_deleted)
    redirect_to(edit_managers_account_path(account))
  end

  private

  def account_manager_params
    params.require(:account_manager).permit(
      :account_id,
      :manager_id,
    )
  end
end


