class AddUserReferenceToCampaign < ActiveRecord::Migration[6.1]
  def change
    add_reference :campaigns, :user, foreign_key: true, null: false
  end
end
