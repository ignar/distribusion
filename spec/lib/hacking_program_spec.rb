require 'spec_helper'

RSpec.describe HackingProgram do
  let(:passphrase) { 'welcome' }
  let(:record) do
    DataSources::Record.new({
      source: 'foo',
      passphrase: passphrase,
      start_node: 'bar',
      end_node: 'baz',
      start_time: Time.now.to_s,
      end_time: Time.now.to_s,
    })
  end
  let(:records_sets) { [DataSources::RecordsSet.new([record])] }
  let(:logger) { double('Logger', error: true) }
  let(:file_content) { File.read("spec/fixtures/loopholes.zip") }
  let(:answer) { File.read("spec/fixtures/answer.json") }

  before do
    stub_request(:get, /#{Terminal::DOMAIN}.*/).
      to_return(:status => 200, :body => file_content)
    stub_request(:post, /#{Terminal::DOMAIN}.*/).
      to_return(status: 503, body: answer)
  end

  subject do
    described_class.new(logger: logger).tap do |o|
      o.passphrase = passphrase
      o.records_sets = records_sets
      o.terminal = Terminal
    end
  end

  describe '#hack' do
    it 'imports data' do
      expect(logger).to receive(:error).exactly(4).times
      expect(logger).to receive(:info).with("STATUS 503")
      subject.hack
    end
  end
end
