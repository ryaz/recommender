class User < ActiveRecord::Base
  #name
  has_many :items
  has_many :categories, through: :items
end
