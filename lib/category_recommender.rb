class CategoryRecommender

  def initialize(user)
    @user = user
  end

  def recommend
    Item.where(@user.categories)
  end
end