class RenameColumnTimeInLightningTalksToTalkTime < ActiveRecord::Migration
  def change
    rename_column :lightning_talks, :time, :talk_time
  end
end
