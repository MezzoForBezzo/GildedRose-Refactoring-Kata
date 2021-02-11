# frozen_string_literal: true

require_relative 'spec_helper'
# require "byebug"

RSpec.shared_examples_for "a successful update" do
  it "does not change the name" do
    items.each do |item|
      name = item.name
      GildedRose.new(items).update_quality()
      expect(item.name).to eq name
    end
  end
end

describe GildedRose do
  describe "#update_quality" do
    let(:items) { [Item.new("foo", 0, 0)] }

    it_behaves_like "a successful update"

    context "aged brie" do
      let(:items) {
        [
          AgedBrie.new(name="Aged Brie", sell_in=2, quality=1),
          AgedBrie.new(name="Aged Brie", sell_in=3, quality=3),
          AgedBrie.new(name="Aged Brie", sell_in=4, quality=5)
        ]
      }

      it_behaves_like "a successful update"

      it "increases the quility" do
        items.each do |item|
          quality = item.quality
          GildedRose.new(items).update_quality()
          expect(item.quality).to eq(quality + 1)
        end
      end
    end

    context "conjured" do
      let(:items) {
        [
          Conjured.new(name="Conjured Mana Cake", sell_in=2, quality=1),
          Conjured.new(name="Conjured Mana Cake", sell_in=3, quality=6),
          Conjured.new("Conjured Mana Cake", sell_in=4, quality=10)
        ]
      }

      it_behaves_like "a successful update"
    end
  end
end
