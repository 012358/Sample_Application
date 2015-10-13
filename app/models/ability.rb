class Ability
  include CanCan::Ability

  def initialize(user)
    if user.email[0..5]=='sajjad'
      can :manage, :all
    else
      can :read, :DefaultController
    end
  end
end
