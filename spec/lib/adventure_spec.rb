require 'spec_helper'

RSpec.describe Adventure do
  describe '.start' do
    it 'receives message from operator' do
      expect(described_class.start).to be_kind_of(Adventure)
    end
  end

  describe '#accept' do
    it 'suggests the red pill' do
      expect(subject.accept).to be_kind_of(Pill)
    end
  end

  describe '#reject' do
    it 'suggests the blue pill' do
      expect(subject.reject).to be_kind_of(Pill)
    end
  end
end
