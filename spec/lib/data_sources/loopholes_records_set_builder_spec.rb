require 'spec_helper'

RSpec.describe DataSources::LoopholesRecordsSetBuilder do
  let(:routes_fixture) { File.join('spec', 'fixtures', 'loopholes', 'routes.json') }
  let(:node_pairs_fixture) { File.join('spec', 'fixtures', 'loopholes', 'node_pairs.json') }
  let(:passphrase) { '' }

  describe '#build' do
    subject do
      described_class.new(
        routes_file: routes_fixture,
        node_pairs_file: node_pairs_fixture,
        passphrase: passphrase
      ).build
    end

    it 'returns records set' do
      expect(subject).to be_kind_of(DataSources::RecordsSet)
    end

    it 'returns all records' do
      expect(subject.count).to eq(4)
    end
  end
end
