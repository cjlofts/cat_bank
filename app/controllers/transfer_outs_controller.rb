class TransferOutsController < ApplicationController
  before_action :authenticate_user!

  def create
    TransferService.new(transfer_out_params, params[:account_id]).run

    redirect_to from_account
  end

  private

  def from_account
    Account.find(params[:account_id])
  end

  def transfer_out_params
    params.require(:transfer_out).permit(:transfer, :user_email)
  end

end