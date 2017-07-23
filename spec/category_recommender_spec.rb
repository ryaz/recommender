require 'rails_helper'
require 'category_recommender'

RSpec.describe CategoryRecommender, '#general' do
  context '#recommend' do
    it 'recommends something' do
      user = create(:user)
      expect(CategoryRecommender.new(user).recommend).to be 0
    end
  end
end
