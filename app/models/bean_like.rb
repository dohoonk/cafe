class BeanLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :bean
end
