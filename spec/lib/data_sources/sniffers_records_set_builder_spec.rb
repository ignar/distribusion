require 'spec_helper'

RSpec.describe DataSources::SniffersRecordsSetBuilder do
  let(:routes_fixture) { File.join('spec', 'fixtures', 'sniffers', 'routes.csv') }
  let(:node_times_fixture) { File.join('spec', 'fixtures', 'sniffers', 'node_times.csv') }
  let(:sequences_fixture) { File.join('spec', 'fixtures', 'sniffers', 'sequences.csv') }
  let(:passphrase) { '' }

  describe '#build' do
    subject do
      described_class.new(
        routes_file: routes_fixture,
        node_times_file: node_times_fixture,
        sequences_file: sequences_fixture,
        passphrase: passphrase
      ).build
    end

    it 'returns records set' do
      expect(subject).to be_kind_of(DataSources::RecordsSet)
    end

    it 'returns all records' do
      expect(subject.count).to eq(5)
    end
  end
end
