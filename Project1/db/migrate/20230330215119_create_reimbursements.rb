class CreateReimbursements < ActiveRecord::Migration[7.0]
  def change
    create_table :reimbursements, if_not_exists: true do |t|
      t.integer :amount
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
