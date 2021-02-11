# frozen_string_literal: true

class Pass < Item
  QUALITY_MAX = 50
  QUALITY_MIN = 0
  CHANGE_OF_QUALITY = 1
  CHANGE_OF_SELL_IN = 1

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update
    update_quality
    update_days_to_sell
  end

  private

  def update_quality
    if sell_in.negative? # Assuming 0 is the day of the concert
      self.quality = 0
    elsif sell_in <= 5
      self.quality += CHANGE_OF_QUALITY * 3
    elsif sell_in <= 10
      self.quality += CHANGE_OF_QUALITY * 2
    else
      self.quality += CHANGE_OF_QUALITY
    end

    self.quality = quality.clamp(QUALITY_MIN, QUALITY_MAX)
  end

  def update_days_to_sell
    # return if sell_in.zero?
    self.sell_in -= CHANGE_OF_SELL_IN
  end
end
