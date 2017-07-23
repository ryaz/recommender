class Recommender
  def initialize(user)
    @user = user
  end

  def by_category
    Item.includes(:categories)
      .where(categories: { id: @user.category_ids.uniq }) - @user.items
  end

  def by_user
    users = User.includes(:items).where(items: { id: @user.item_ids.uniq }) - [@user]
    Item.includes(:users).where(users: { id: users.map(&:id) }) - @user.items
  end
end
