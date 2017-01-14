require 'spec_helper'

RSpec.describe DataSourceLoader do
  subject { described_class }
  it { is_expected.to respond_to(:load) }
end
