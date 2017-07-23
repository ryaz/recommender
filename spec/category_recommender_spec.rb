require 'rails_helper'
require 'category_recommender'

RSpec.describe CategoryRecommender, '#general' do
  context '#recommend' do
    it 'recommends nothing (0) if there is no items in store' do
      user = create(:user)
      expect(CategoryRecommender.new(user).recommend.count).to be 0
    end

    it 'recommends 2 items from similar categories' do
      user = create(:user)
      nike_cat = create(:category, name: 'Nike')
      bball_cat = create(:category, name: 'Basketball')
      shoes_cat = create(:category, name: 'Shoes')
      cloth_cat = create(:category, name: 'Clothing')
      balls_cat = create(:category, name: 'Balls')
      adidas_cat = create(:category, name: 'Addidas')
      accs_cat = create(:category, name: 'Accessories')

      item1 = create(:item, name: 'Nike Dunks',
        categories: [shoes_cat, bball_cat, nike_cat],
        users: [user])
      item2 = create(:item, name: 'Nike Street Basketball', categories: [balls_cat, bball_cat, nike_cat])
      item3 = create(:item, name: 'Addidas Jersey', categories: [cloth_cat, bball_cat, adidas_cat])
      item4 = create(:item, name: 'Golf bag', categories: [accs_cat])
      expect(CategoryRecommender.new(user).recommend.count).to be 2
      expect(CategoryRecommender.new(user).recommend).to include(item2, item3)
      expect(CategoryRecommender.new(user).recommend).to_not include(item1, item4)
    end
  end
end
