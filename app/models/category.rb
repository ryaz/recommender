class Category < ActiveRecord::Base
  #name
  has_many :items

end