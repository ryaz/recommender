require 'rails_helper'
require 'recommender'

RSpec.describe Recommender, '#general' do
  context '#by_category' do
    let!(:user) { create(:user) }
    let!(:nike_cat) { create(:category, name: 'Nike') }
    let!(:bball_cat) { create(:category, name: 'Basketball') }
    let!(:shoes_cat) { create(:category, name: 'Shoes') }
    let!(:cloth_cat) { create(:category, name: 'Clothing') }
    let!(:balls_cat) { create(:category, name: 'Balls') }
    let!(:adidas_cat) { create(:category, name: 'Addidas') }
    let!(:accs_cat) { create(:category, name: 'Accessories') }

    let!(:item1) { create(:item, name: 'Nike Dunks',
      categories: [shoes_cat, bball_cat, nike_cat],
      users: [user]) }
    let!(:item2) { create(:item, name: 'Nike Street Basketball',
      categories: [balls_cat, bball_cat, nike_cat]) }
    let!(:item3) { create(:item, name: 'Addidas Jersey',
      categories: [cloth_cat, bball_cat, adidas_cat]) }
    let!(:item4) { create(:item, name: 'Golf bag', categories: [accs_cat]) }

    it 'recommends nothing (0) if there is no items in store' do
      user = create(:user)
      expect(Recommender.new(user).by_category.count).to be 0
    end

    it 'excludes Nike Dunks and Golf bag' do
      expect(Recommender.new(user).by_category).to_not include(item1, item4)
    end

    it 'includes Nike Street Basketball and Addidas Jersey' do
      expect(Recommender.new(user).by_category).to include(item2, item3)
    end

    it 'recommends 2 items from similar categories' do
      expect(Recommender.new(user).by_category.count).to be 2
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

    it 'excludes already bought items for John' do
      expect(Recommender.new(john).by_user).to_not include(item1)
    end
  end
end
