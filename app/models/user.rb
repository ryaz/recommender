class User < ApplicationRecord
  #name
  has_many :items
  has_many :categories, through: :items
end
