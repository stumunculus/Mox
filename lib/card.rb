class Card
  attr_accessor :name, :mana_cost, :set, :text, :type

  def initialize
    @type = self.class
  end

  def cmc(cost)
    cmc = 0
    cost.split("").each do |t|
      cmc += t.to_i
      cmc += 1 if t =~ /[WUBRG]/
    end
    cmc
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

