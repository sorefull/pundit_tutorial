class PostPolicy
  attr_reader :user, :post

  def initialize(user = current_user, post)
    @user = user
    @post = post
  end

  def edit?
    update?
  end

  def update?
    user && user.admin?
  end

  def new?
    create?
  end

  def create?
    user && user.admin?
  end

  def destroy?
    user && user.admin?
  end
end
