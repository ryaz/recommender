class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :items do |t|
      t.string :name
    end

    create_table :categories do |t|
      t.string :name
    end

    create_table :items_users, id: false do |t|
      t.references :item
      t.references :user
    end

    add_index :items_users, [:item_id, :user_id]

    create_table :categories_items, id: false do |t|
      t.references :category
      t.references :item
    end

    add_index :categories_items, [:category_id, :item_id]
  end
end
