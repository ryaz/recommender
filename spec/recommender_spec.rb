require 'rails_helper'
require 'recommender'

RSpec.describe Recommender, '#general' do
  context '#by_category' do
    it 'recommends nothing (0) if there is no items in store' do
      user = create(:user)
      expect(Recommender.new(user).by_category.count).to be 0
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
      expect(Recommender.new(user).by_category.count).to be 2
      expect(Recommender.new(user).by_category).to include(item2, item3)
      expect(Recommender.new(user).by_category).to_not include(item1, item4)
    end
  end

  context '#by_user' do
    let!(:john) { create(:user, name: 'John') }
    let!(:jane) { create(:user, name: 'Jane') }
    let!(:jim) { create(:user, name: 'Jim') }

    let!(:item1) {
      create(:item, name: 'Nike Dunks', users: [john, jane]) }
    let!(:item2) {
      create(:item, name: 'Nike Street Basketball', users: [jane, jim]) }
    let!(:item3) {
      create(:item, name: 'Golf bag', users: [jim]) }

    it 'recomends Nike Dunks item for Jim' do
      expect(Recommender.new(jim).by_user).to include(item1)
    end

    it 'recomends Golf bag item for Jane' do
      expect(Recommender.new(jane).by_user).to include(item3)
    end

    it 'recomends Nike Street Basketball item for John' do
      expect(Recommender.new(john).by_user).to include(item2)
    end
  end
end
