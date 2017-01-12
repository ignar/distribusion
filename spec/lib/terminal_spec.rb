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
end
