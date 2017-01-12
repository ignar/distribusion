require 'spec_helper'

RSpec.describe PillsBuilder do
  describe '#pill' do
    it 'returns an instance of a pill' do
      builder = described_class
      builder.set_color(:red)
      builder.set_location('http://location.com/one')
      builder.set_passpharse('passphrase')
      expect(builder.pill).to be_kind_of(Pill)
    end
  end
end
