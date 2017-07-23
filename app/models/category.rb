class Category < ApplicationRecord
  #name
  has_and_belongs_to_many :items
end
