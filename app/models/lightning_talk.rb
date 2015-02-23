class LightningTalk < ActiveRecord::Base
  validates :user, presence: true
  validates :description, presence: true
  validates :date, presence:true
end
