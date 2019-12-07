class AddDefaultValueToSubscriptionInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :subscription, :boolean, default: false, null: false
  end
end
