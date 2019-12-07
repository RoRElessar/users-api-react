class ChangeSexFieldTypeInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :sex, :string, default: 'male'
  end
end
