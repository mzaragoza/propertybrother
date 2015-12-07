class Managers::AccountPaymentsController < ManagerController
  expose(:account){ Account.find(params[:account_id]) }
  expose(:account_payments){ account.account_payments.order("id DESC") }
  expose(:account_payment, attributes: :account_payment_params)

  def create
    if account_payment.save
      flash[:notice] = t(:account_payment_was_successfully_created)
      redirect_to(edit_managers_account_path(account))
    else
      render :new
    end
  end

  def update
    if account_payment.save
      flash[:notice] = t(:account_payment_was_successfully_updated)
      redirect_to(edit_managers_account_path(account))
    else
      render :edit
    end
  end

  def destroy
    account_payment.delete
    flash[:notice] = t(:account_was_successfully_deleted)
    redirect_to(edit_managers_account_path(account))
  end

  private

  def account_payment_params
    params.require(:account_payment).permit(
      :payment_type,
      :payment_date,
      :amount,
    )
  end
end

