class Ability
  include CanCan::Ability

  def initialize(producer)
    
      producer ||= Producer.new # guest producer (not logged in)
      if producer.admin?
        can :manage, :all
      else
        can :read, :all
      end

  end
end
