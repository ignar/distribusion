require 'spec_helper'

RSpec.describe DataSourcePipeline::LoadSourceStep do
  let(:source) { 'loopholes' }
  let(:passphrase) { 'password' }
  let(:answer) { 'answer' }

  before do
    stub_request(:get, /#{Terminal::DOMAIN}.*/).
      to_return(:status => 200, :body => answer)
  end

  it 'loads archive' do
    result = described_class.call(source_name: source, passphrase: passphrase)
    expect(result).to eq(answer)
  end
end
