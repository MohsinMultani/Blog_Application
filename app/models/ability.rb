class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can [:create, :destroy], Blog, :user_id => user.id
      can :update, Blog, :user_id => user.id     #not implemeted in this project.
      can [:destroy, :create], Comment, :user_id => user.id
    end
  end
end
