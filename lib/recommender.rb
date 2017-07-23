class Recommender
  def initialize(user)
    @user = user
  end

  def by_category
    Item.includes(:categories)
      .where(categories: { id: @user.category_ids.uniq })
      .where.not(id: @user.item_ids)
  end

  def by_user
    user_ids = User.includes(:items)
      .where(items: { id: @user.item_ids.uniq })
      .where.not(id: @user.id).pluck(:id)
    Item.includes(:users).where(users: { id: user_ids })
      .where.not(id: @user.item_ids)
  end
end
