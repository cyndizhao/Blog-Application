class Ability < ApplicationRecord
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    if user.is_admin?
      can :manage, :all
    end

    can [:edit, :destroy], Post do |post|
      post.user == user
    end

    can [:destroy], Comment do |comment|
      comment.user == user
    end
  end
end
