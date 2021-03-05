class AddEstimatedDurationToCampaign < ActiveRecord::Migration[6.1]
  def change
    add_column :campaigns, :estimated_duration, :integer
  end
end
