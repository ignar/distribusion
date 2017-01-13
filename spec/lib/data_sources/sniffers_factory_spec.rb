require 'spec_helper'

RSpec.describe DataSources::SniffersFactory do
  subject { described_class.new(location: '/tmp', passphrase: '') }

  describe '#builder' do
    it 'returns builder' do
      expect(subject.builder).to be_kind_of(DataSources::SniffersRecordsSetBuilder)
    end
  end
end
