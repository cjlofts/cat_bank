class AddTransferReferenceToTransferInsAndOuts < ActiveRecord::Migration[7.1]
  def change
    add_reference :transfer_ins, :transfer, index: true
    add_reference :transfer_outs, :transfer, index: true
  end
end
