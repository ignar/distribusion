require 'spec_helper'
require 'fileutils'

RSpec.describe DataSourcePipeline do
  describe '#process' do
    let(:zip_file_name) { 'loopholes.zip' }
    let(:file_name) { 'test' }
    let(:source_name) { 'loopholes' }
    let(:file_content) { File.read("spec/fixtures/#{zip_file_name}") }
    let(:passphrase) { '' }
    let(:tmpdir) { Dir.mktmpdir }

    before do
      stub_request(:get, /#{Terminal::DOMAIN}.*/).
        to_return(status: 200, body: file_content)
    end

    subject do
      described_class.new(
        source_name: source_name,
        passphrase: passphrase,
        destination_dir: tmpdir
      )
    end

    after do
      FileUtils.rm_r(tmpdir)
    end

    it 'loads data' do
      records_set = subject.process
      expect(records_set).to_not be_empty
    end
  end
end
