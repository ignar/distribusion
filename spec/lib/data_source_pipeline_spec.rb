require 'spec_helper'
require 'fileutils'

RSpec.describe DataSourcePipeline do
  describe '#process' do
    let(:zip_file_name) { 'testzip' }
    let(:file_name) { 'test' }
    let(:source_name) { 'loopholes' }
    let(:file_content) { File.read("spec/fixtures/#{zip_file_name}") }

    before do
      stub_request(:get, /#{Terminal::DOMAIN}.*/).
        to_return(:status => 200, :body => file_content)
    end

    let(:tmpdir) { Dir.mktmpdir }

    subject { described_class.new(source_name: source_name, destination_dir: tmpdir) }

    after do
      FileUtils.rm_r(tmpdir)
    end

    it 'saves' do
      subject.process
      expect(File.file?(File.join(tmpdir, source_name, file_name))).to be_truthy
    end

    it 'loads data'
  end
end
