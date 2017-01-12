require 'spec_helper'

RSpec.describe Pill do
  it { is_expected.to respond_to(:color) }
  it { is_expected.to respond_to(:location) }
  it { is_expected.to respond_to(:passphrase) }
end
