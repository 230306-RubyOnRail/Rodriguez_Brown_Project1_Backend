class AddUserIdToReimbursements < ActiveRecord::Migration[7.0]
  def change
    add_reference :reimbursements, :users, foreign_key: true
    add_column :users, :admin, :boolean
  end
end
