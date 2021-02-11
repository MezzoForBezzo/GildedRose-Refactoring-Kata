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
    context "aged brie" do
      let(:items) {
        [
          AgedBrie.new(sell_in=2, quality=1),
          AgedBrie.new(sell_in=3, quality=3),
          AgedBrie.new(sell_in=4, quality=5)
        ]
      }

      it_behaves_like "a successful update"

      it "increases the quality" do
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
          Conjured.new(name="Mana Cake 1", sell_in=2, quality=1),
          Conjured.new(name="Mana Cake 2", sell_in=3, quality=6),
          Conjured.new(name="Mana Cake 3", sell_in=4, quality=10)
        ]
      }

      it_behaves_like "a successful update"
    end
  end
end
