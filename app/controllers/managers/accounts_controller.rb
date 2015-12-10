class Managers::AccountsController < ManagerController
  expose(:accounts){ Account.order("id DESC") }
  expose(:account, attributes: :account_params)
  expose(:payments){ account.account_payments }
  expose(:account_managers){ account.account_managers }
  expose(:account_documents){ account.account_documents }

  def create
    if account.save
      flash[:notice] = t(:account_was_successfully_created)
      redirect_to(managers_accounts_path)
    else
      render :new
    end
  end

  def update
    if account.save
      flash[:notice] = t(:account_was_successfully_updated)
      redirect_to(managers_accounts_path)
    else
      render :edit
    end
  end

  def destroy
    account.delete
    flash[:notice] = t(:account_was_successfully_deleted)
    redirect_to(managers_accounts_path)
  end

  private

  def account_params
    params.require(:account).permit(
      :subdomain ,
      :name,
      :address,
      :city,
      :state,
      :zip,
      :number_of_appartments,
      :monthly_fee,
    )
  end
end
