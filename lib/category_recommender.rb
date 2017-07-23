class CategoryRecommender
  def initialize(user)
    @user = user
  end

  def recommend
    Item.includes(:categories)
      .where(categories: { id: @user.category_ids.uniq}) - @user.items
    #find user categories
    #find items related to categories
    #exclude already bought by user
  end
end
