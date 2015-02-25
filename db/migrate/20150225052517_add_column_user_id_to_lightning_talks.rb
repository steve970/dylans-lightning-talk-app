class AddColumnUserIdToLightningTalks < ActiveRecord::Migration
  def change
    add_column :lightning_talks, :user_id, :integer
  end
end
