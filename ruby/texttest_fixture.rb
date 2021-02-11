#!/usr/bin/ruby -w
require File.join(File.dirname(__FILE__), 'gilded_rose')
require File.join(File.dirname(__FILE__), 'item')
require_relative 'item/vest'
require_relative 'item/aged_brie'
require_relative 'item/elixir'
require_relative 'item/sulfuras'
require_relative 'item/pass'
require_relative 'item/conjured'

puts "OMGHAI!"
items = [
  Vest.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  AgedBrie.new(name="Aged Brie", sell_in=2, quality=0),
  Elixir.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Sulfuras.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  Sulfuras.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  Pass.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Pass.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  Pass.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  # This Conjured item does not work properly yet
  Conjured.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
]

days = 2
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
