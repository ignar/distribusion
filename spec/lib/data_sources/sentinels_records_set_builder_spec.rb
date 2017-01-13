require 'spec_helper'

RSpec.describe DataSources::SentinelsRecordsSetBuilder do
  let(:routes_fixture) { File.join('spec', 'fixtures', 'sentinels', 'routes.csv') }
  let(:passphrase) { '' }

  describe '.build' do
    subject do
      described_class.new(
        routes_file: routes_fixture,
        passphrase: passphrase
      ).build
    end

    it 'returns records set' do
      expect(subject).to be_kind_of(DataSources::RecordsSet)
    end

    it 'returns all records' do
      expect(subject.count).to eq(8)
    end
  end
end

