class Bean < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  validates :name, presence: true
  validates :region, presence: true

end
