# frozen_string_literal: true

require_relative '../spec_helper'
require_relative 'shared_examples'
# require 'byebug'

RSpec.describe Sulfuras do
  subject { Sulfuras.new(name, sell_in, quality) }
  let(:name) { 'of Leonard Nimoy' }
  let(:sell_in) { Sulfuras::LEGENDARY_SELL_IN }
  let(:quality) { Sulfuras::LEGENDARY_QUALITY }
  let(:rate_of_change_in_quality) { 0 }
  let(:rate_of_change_in_sell_in) { 0 }

  describe '#update' do
    it 'does not change the quality' do
      expect { subject.update }.to_not change { subject.quality }.from(Sulfuras::LEGENDARY_QUALITY)
    end

    it 'does not change the sell_in' do
      expect { subject.update }.to_not change { subject.sell_in }.from(Sulfuras::LEGENDARY_SELL_IN)
    end
  end
end
