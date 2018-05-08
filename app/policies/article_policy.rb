class ArticlePolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.where(user_id: @user.try(:id))
  #   end
  # end
  def index?
    true
  end

  def api?
    true
  end

  def show?
    true
  end

def create?
    user.present?
  end

  def update?
    user.present? && user == article.user
  end

  def edit?
    user.present? && user == article.user
  end

  def destroy?
    user.present? && user == article.user
  end

  def article
    record
  end
end
