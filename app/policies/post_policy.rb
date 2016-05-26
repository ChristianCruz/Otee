class PostPolicy < ApplicationPolicy
  # Here, we can define some Post-specific rules.
  # Inheritance will cause Post's policy to be the same as the default application policy.

  def index?
    true
  end

  def destroy?
    user.present? && can_moderate?(user, record)
  end
end