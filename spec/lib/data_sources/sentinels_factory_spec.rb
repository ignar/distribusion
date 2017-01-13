require 'spec_helper'

RSpec.describe DataSources::SentinelsFactory do
  subject { described_class.new(location: '/tmp', passphrase: '') }

  describe '#builder' do
    it 'returns builder' do
      expect(subject.records_set_builder).to be_kind_of(DataSources::SentinelsRecordsSetBuilder)
    end
  end
end
