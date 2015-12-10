class Managers::AccountDocumentsController < ManagerController
  expose(:account){ Account.find(params[:account_id]) }
  expose(:account_documents){ account.account_documents.order("id DESC") }
  expose(:account_document, attributes: :account_document_params)

  def create
    if account_document.save
      flash[:notice] = t(:account_document_was_successfully_created)
      redirect_to(edit_managers_account_path(account))
    else
      render :new
    end
  end

  def update
    if account_document.save
      flash[:notice] = t(:account_payment_was_successfully_updated)
      redirect_to(edit_managers_account_path(account))
    else
      render :edit
    end
  end

  def destroy
    account_document.delete
    flash[:notice] = t(:account_was_successfully_deleted)
    redirect_to(edit_managers_account_path(account))
  end

  private

  def account_document_params
    params.require(:account_document).permit(
      :name,
      :document_type,
      :file,
    )
  end
end

