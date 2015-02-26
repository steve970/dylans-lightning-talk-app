class RemoveColumnUserFromLightningTalks < ActiveRecord::Migration
  def change
    remove_column :lightning_talks, :user
  end
end
