class Ability
  include CanCan::Ability

  def initialize(user)
    user = user || User.new
    can :manage, :all if user.super?
    can :read, User
    can :read, Message
    can :create, Message
    can :update, User, :id => user.id
  end
end