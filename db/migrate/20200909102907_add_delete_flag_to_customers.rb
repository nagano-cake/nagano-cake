class AddDeleteFlagToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :delete_flag, :boolean
  end
end
