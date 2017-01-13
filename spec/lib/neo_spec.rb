require 'spec_helper'

RSpec.describe Neo do
  let(:blue_pill) { double('Pill', color: 'blue') }
  let(:red_pill) { double('Pill', color: 'red') }
  let(:adventure) { double('Adventure', red_pill: red_pill, blue_pill: blue_pill) }

  subject { described_class.new(adventure) }

  context 'when choose red pill' do
    describe '#accept_adventure' do
      it 'receives instructions' do
        expect(subject.accept_adventure.color).to eq('red')
      end
    end
  end

  context 'when choose blue pill' do
    describe '#reject_adventure' do
      it 'wakes up' do
        expect(subject.reject_adventure.color).to eq('blue')
      end
    end
  end
end
