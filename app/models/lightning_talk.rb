class LightningTalk < ActiveRecord::Base
  TIMES = ['4:30PM', '4:35PM','4:40PM', '4:45PM', '4:50PM']

  validates :description, presence: true
  validates :user, presence: true
  validates :date, presence: true
  validates :talk_time, presence: true
  validates_uniqueness_of :date, scope: :talk_time
  validate :must_be_tuesday_or_thursday

  belongs_to :user

  def must_be_tuesday_or_thursday
    if date.strftime("%A") != "Tuesday" && date.strftime("%A") != "Thursday"
      errors[:base]  << "Date must be on Tuesday or Thursday"
    end
  end

end
