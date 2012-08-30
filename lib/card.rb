
module CreatureStuff
 attr_accessor :power, :toughness

  def pt
    "#{self.power}/#{self.toughness}"
  end
end

module ArtifactStuff



end

module EnchantmentStuff

end

module LandStuff
end

module PlaneswalkerStuff
  attr_accessor :loyalty
end


class Card
  attr_accessor :supertype, :name, :mana_cost, :set, :text, :type, :subtype, :rarity, :collectors_no, :flavor, :artist
  def initialize args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @type = self.class
  end

  def cmc
    cmc = 0
    self.mana_cost.split("").each do |t|
      cmc += t.to_i
      cmc += 1 if t =~ /[WUBRG]/
    end
    cmc
  end
  def is_multicolored?
    if self.color_id.size >= 2
      true
    else
      false
    end
  end
  def color_id
    colors = []
    self.mana_cost.split("").each do |t|
       case t
       when "W"
        colors << "White"
       when "U"
        colors << "Blue"
       when "B"
        colors << "Black"
       when "R"
        colors << "Red"
       when "G"
        colors << "Green"
       end
     end
     colors.uniq
  end
end

class Permanent < Card
end

class NonPermanent < Card
end


class Creature < Permanent
 include CreatureStuff
end

class Instant < NonPermanent
end

class Artifact < Permanent
  include ArtifactStuff
end

class Planeswalker < Permanent
  include PlaneswalkerStuff
end

class Land < Permanent

end

class Enchantment < Permanent
end

class ArtifactCreature < Permanent
  include CreatureStuff
  include ArtifactStuff
end
