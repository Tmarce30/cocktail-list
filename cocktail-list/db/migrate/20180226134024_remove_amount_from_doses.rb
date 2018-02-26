class RemoveAmountFromDoses < ActiveRecord::Migration[5.0]
  def change
    remove_column :doses, :amount, :integer
  end
end
