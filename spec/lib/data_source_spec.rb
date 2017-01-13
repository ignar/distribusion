require 'spec_helper'

RSpec.describe DataSourceAdapter do
  it { is_expected.to respond_to(:source) }
  it { is_expected.to respond_to(:data) }
  it { expect(subject.data).to be_kind_of(Array) }
  it { expect(subject.data.first).to be_kind_of(Record) }
end
