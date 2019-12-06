class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :region
      t.boolean :sex
      t.boolean :subscription
      t.string :additional_information
      t.string :image

      t.timestamps
    end
  end
end
