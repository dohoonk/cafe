class Bean < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :region, presence: true

end
