class Item < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :users
end
