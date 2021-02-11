# frozen_string_literal: true

require_relative '../spec_helper'
require_relative 'shared_examples'
# require 'byebug'

RSpec.describe AgedBrie do
  subject { AgedBrie.new(sell_in, quality) }
  let(:sell_in) { 10 }
  let(:quality) { 5 }
  let(:rate_of_change_in_quality) { 1 }
  let(:rate_of_change_in_sell_in) { -1 }

  describe '#update' do
    include_examples 'a successful update'
  end
end
