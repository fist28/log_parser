require 'spec_helper'
require 'rspec'

describe LogFileProcessor do
  subject { described_class.new(file) }
  let(:file) { Pathname.new('spec/fixtures/webserver_mini.log') }
  before { subject.call }

  it '#entries return array of LogEntry objects' do
    expect(subject.entries).to be_instance_of(Array)
    expect(subject.entries.first).to be_instance_of(LogEntry)
  end

  it '#paths return array of Path objects' do
    expect(subject.paths).to be_instance_of(Hash)
    expect(subject.paths.values.first).to be_instance_of(Path)
  end

  it '#ip return array of IP objects' do
    expect(subject.ips).to be_instance_of(Hash)
    expect(subject.ips.values.first).to be_instance_of(IP)
  end
end
