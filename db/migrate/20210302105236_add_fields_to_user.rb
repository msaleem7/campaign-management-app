class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profession, :string
    add_column :users, :service, :string
  end
end
