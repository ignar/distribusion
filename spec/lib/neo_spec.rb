require 'spec_helper'

RSpec.describe Neo do
  let(:adventure) { double('Adventure', acceptance_path: '', rejection_path: '') }

  subject { described_class.new(adventure) }

  context 'when choose red pill' do
    describe '#accept_adventure' do
      it 'receives instructions' do
        expect(subject.accept_adventure).to be_kind_of(String)
      end
    end
  end

  context 'when choose blue pill' do
    describe '#reject_adventure' do
      it 'wakes up' do
        expect(subject.reject_adventure).to be_kind_of(String)
      end
    end
  end
end
