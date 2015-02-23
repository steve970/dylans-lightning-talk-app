class CreateLightningTalks < ActiveRecord::Migration
  def change
    create_table :lightning_talks do |t|
      t.string :user
      t.string :description
      t.date :date

      t.timestamps null: false
    end
  end
end
