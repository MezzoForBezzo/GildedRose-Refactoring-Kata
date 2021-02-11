# frozen_string_literal: true

class Sulfuras < Item
  LEGENDARY_QUALITY = 80
  LEGENDARY_SELL_IN = '∞'

  def initialize(name, sell_in, quality)
    @name = 'Sulfuras, ' + name
    super(@name, LEGENDARY_SELL_IN, LEGENDARY_QUALITY)
  end

  def update
  end
end
