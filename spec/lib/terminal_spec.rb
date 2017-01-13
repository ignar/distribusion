require 'spec_helper'

RSpec.describe Terminal do
  before do
    stub_request(:get, /#{Terminal::DOMAIN}.*/).
      to_return(:status => 200, :body => { pills: {} }.to_json)
  end

  describe '.receive_warning' do
    it 'returns message with pills' do
      expect(described_class.receive_warning).to have_key('pills')
    end
  end

  describe described_class::ImportAnswer do
    context 'when answer is successful' do
      subject do
        described_class.new.tap do |a|
          a.status = 200
        end
      end

      it { is_expected.to be_successful }
    end

    context 'when answer fail' do
      subject do
        described_class.new.tap do |a|
          a.status = 503
        end
      end

      it { is_expected.not_to be_successful }
    end
  end
end
