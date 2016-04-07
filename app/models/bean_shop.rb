class BeanShop < ActiveRecord::Base
  belongs_to :bean
  belongs_to :shop
end
