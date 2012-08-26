class Card
  attr_accessor :name, :mana_cost, :set, :text, :type

  def initialize 
    @type = self.class
  end
end 

class Permanent < Card
end

class NonPermanent < Card
end


class Creature < Permanent 
  attr_accessor :power, :toughness, :creature_type

  def pt
    "#{self.power}/#{self.toughness}"
  end
end

class Instant < NonPermanent
end

