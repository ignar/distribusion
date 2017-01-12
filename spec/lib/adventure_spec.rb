require 'spec_helper'

RSpec.describe Adventure do
  let(:red_location) { 'red-location' }
  let(:blue_location) { 'blue-location' }
  let(:choice) do
    {
      pills: {
        red: {
          location: red_location,
          passphrase: ''
        },
        blue: {
          location: blue_location
        }
      }
    }
  end

  subject { Adventure.start }

  before do
    stub_request(:get, /#{Terminal::DOMAIN}.*/).
      to_return(:status => 200, :body => choice.to_json)
  end

  describe '.start' do
    it 'receives message from operator' do
      expect(described_class.start).to be_kind_of(Adventure)
    end
  end

  describe '#acceptance_path' do
    it 'suggests the red pill' do
      expect(subject.acceptance_path).to eq(red_location)
    end
  end

  describe '#rejection_path' do
    it 'suggests the blue pill' do
      expect(subject.rejection_path).to eq(blue_location)
    end
  end
end
