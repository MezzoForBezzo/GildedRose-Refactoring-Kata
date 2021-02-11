# frozen_string_literal: true

require_relative '../spec_helper'
require_relative 'shared_examples'
# require 'byebug'

RSpec.describe Conjured do
  subject { Conjured.new(name, sell_in, quality) }
  let(:name) { 'mana cakes' }
  let(:sell_in) { 10 }
  let(:quality) { 5 }
  let(:rate_of_change_in_quality) { -subject.class::CHANGE_OF_QUALITY }
  let(:rate_of_change_in_sell_in) { -subject.class::CHANGE_OF_SELL_IN }

  describe '#update' do
    include_examples 'a successful update'

    context 'qaulity is above 50' do
      let(:quality) { 90 }

      it 'adjusts it back to 50' do
        subject.update

        expect(subject.quality).to eq 50
      end
    end


    context 'when the sell in is below 0' do
      let(:sell_in) { -10 }

      it 'doubles the change in quality' do
        expect { subject.update }.to change { subject.quality }.by(rate_of_change_in_quality * 2)
      end
    end
  end
end
