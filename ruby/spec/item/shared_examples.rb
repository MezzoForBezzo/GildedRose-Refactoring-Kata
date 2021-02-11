# frozen_string_literal: true

RSpec.shared_examples_for 'a successful update' do
  it 'increases the quality' do
    expect { subject.update }.to change { subject.quality }.by(rate_of_change_in_quality)
  end

  it 'decreases the sell_in' do
    expect { subject.update }.to change { subject.sell_in }.by(rate_of_change_in_sell_in)
  end

  context 'qaulity is above 50' do
    let(:quality) { 90 }

    it 'adjusts it back to 50' do
      subject.update

      expect(subject.quality).to eq subject.class::QUALITY_MAX
    end
  end

  context 'qaulity is below 0' do
    let(:quality) { -90 }

    it 'adjusts it back to 0' do
      subject.update

      expect(subject.quality).to eq subject.class::QUALITY_MIN
    end
  end

  context 'sell in is below 0' do
    let(:quality) { -90 }

    it 'updates the value' do
      subject.update

      expect { subject.update }.to change { subject.sell_in }.by(rate_of_change_in_sell_in)
    end
  end
end
