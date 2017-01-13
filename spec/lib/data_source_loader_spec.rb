require 'spec_helper'

RSpec.describe DataSourceLoader do
  describe '#data_sources' do
    subject { described_class.new.records_sets }

    it { is_expected.to be_kind_of(Array) }
  end
end
