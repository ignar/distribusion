require 'spec_helper'

RSpec.describe Record do
  it { is_expected.to respond_to(:source) }
  it { is_expected.to respond_to(:start_node) }
  it { is_expected.to respond_to(:end_node) }
  it { is_expected.to respond_to(:start_time) }
  it { is_expected.to respond_to(:end_time) }
end
