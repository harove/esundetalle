class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #      can :manage, :all
    #   else
    #      can :read, :create, :update, :all
    #   end
    if user.email == 'super@esundetalle.cl'
      can :manage, :all
    else
       can :read, Product
       can [:create, :read, :destroy, :clean], Order, user_id: user.id
    end
  end
end
