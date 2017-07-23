require 'csv'

%w|category item user|.each do |model_name|
  CSV.open("lib/mini_proj-#{model_name.pluralize}.csv", 'r', col_sep: "\t", headers: true).each do |row|
    model_name.titleize.constantize.create!(id: row["#{model_name}_id"], name: row['name'])
  end
end

CSV.open('lib/mini_proj-categories_items.csv', 'r', col_sep: "\t", headers: true).each do |row|
  class CategoryItem < ActiveRecord::Base; self.table_name = 'categories_items'; end
  CategoryItem.create(category_id: row['category_id'], item_id: row['item_id'])
end

CSV.open('lib/mini_proj-items_users.csv', 'r', col_sep: "\t", headers: true).each do |row|
  class ItemUser < ActiveRecord::Base; self.table_name = 'items_users'; end
  ItemUser.create(user_id: row['user_id'], item_id: row['item_id'])
end
