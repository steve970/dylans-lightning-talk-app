class AddColumnTimeToLightningTalks < ActiveRecord::Migration
  def change
    add_column :lightning_talks, :time, :time
  end
end
