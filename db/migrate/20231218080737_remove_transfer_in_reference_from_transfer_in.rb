class RemoveTransferInReferenceFromTransferIn < ActiveRecord::Migration[7.1]
  def change
    remove_reference :transfer_ins, :transfer_in
  end
end
