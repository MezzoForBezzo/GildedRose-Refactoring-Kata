# frozen_string_literal: true

class Vest < Item
  QUALITY_MAX = 50
  QUALITY_MIN = 0
  CHANGE_OF_QUALITY = 1
  CHANGE_OF_SELL_IN = 1

  def initialize(name, sell_in, quality)
    @name = name + ' Vest'
    super(@name, sell_in, quality)
  end

  def update
    update_quality
    update_days_to_sell
  end

  private

  def update_quality
    change = sell_in.negative? ? CHANGE_OF_QUALITY * 2 : CHANGE_OF_QUALITY

    self.quality -= change

    self.quality = quality.clamp(QUALITY_MIN, QUALITY_MAX)
  end

  def update_days_to_sell
    # return if sell_in.zero?
    self.sell_in -= CHANGE_OF_SELL_IN
  end
end
