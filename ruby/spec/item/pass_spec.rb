# frozen_string_literal: true

require_relative '../spec_helper'
require_relative 'shared_examples'
# require 'byebug'

RSpec.describe Pass do
  subject { Pass.new(name, sell_in, quality) }
  let(:name) { 'Elton John backstage pass #1294' }
  let(:sell_in) { 15 }
  let(:quality) { 5 }
  let(:rate_of_change_in_quality) { subject.class::CHANGE_OF_QUALITY }
  let(:rate_of_change_in_sell_in) { -subject.class::CHANGE_OF_SELL_IN }

  describe '#update' do
    include_examples 'a successful update'

    context 'when the sell in is below 0' do
      let(:sell_in) { -2 }

      it 'becomes 0' do
        expect { subject.update }.to change { subject.quality }.to(0)
      end
    end

    context 'when the sell in is between 0 and 5' do
      let(:sell_in) { 3 }

      it 'tripples the change in quality' do
        expect { subject.update }.to change { subject.quality }.by(rate_of_change_in_quality * 3)
      end
    end

    context 'when the sell in is between 5 and 10' do
      let(:sell_in) { 8 }

      it 'doubles the change in quality' do
        expect { subject.update }.to change { subject.quality }.by(rate_of_change_in_quality * 2)
      end
    end
  end
end
