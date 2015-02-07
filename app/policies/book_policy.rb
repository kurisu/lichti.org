class BookPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @book = model
  end

  def index?
    true
  end

  def cover?
    true
  end

  def edit?
    @current_user && @current_user.admin?
  end

  def new?
    @current_user && @current_user.admin?
  end

  def create?
    @current_user && @current_user.admin?
  end

  def show?
    true
  end

  def update?
    @current_user && @current_user.admin?
  end

  def destroy?
    @current_user && @current_user.admin?
  end

end